<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");

include_once 'config/database.php';

$database = new Database();
$db = $database->getConnection();
$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'GET') {
    $status_filter = isset($_GET['status']) ? $_GET['status'] : 'APPROVED';
    $location = isset($_GET['location']) ? $_GET['location'] : '';
    $min_price = isset($_GET['min_price']) ? $_GET['min_price'] : '';
    $max_price = isset($_GET['max_price']) ? $_GET['max_price'] : '';
    $min_area = isset($_GET['min_area']) ? $_GET['min_area'] : '';
    $max_area = isset($_GET['max_area']) ? $_GET['max_area'] : '';
    $lat = isset($_GET['lat']) ? $_GET['lat'] : '';
    $lng = isset($_GET['lng']) ? $_GET['lng'] : '';
    $radius = isset($_GET['radius']) ? $_GET['radius'] : 5;
    
    $query = "SELECT r.id, r.title, r.description, r.price, r.area, r.address, r.latitude, r.longitude, r.image_url, r.status, r.rejection_reason, u.username as lessor_name, u.phone ";
    
    if ($lat !== '' && $lng !== '') {
        $query .= ", (6371 * acos(cos(radians(:lat)) * cos(radians(r.latitude)) * cos(radians(r.longitude) - radians(:lng)) + sin(radians(:lat)) * sin(radians(r.latitude)))) AS distance ";
    }
    
    $query .= "FROM room_listings r LEFT JOIN users u ON r.lessor_id = u.id WHERE r.status = :status ";

    if ($location !== '') {
        $query .= "AND r.address LIKE :location ";
    }
    if ($min_price !== '') {
        $query .= "AND r.price >= :min_price ";
    }
    if ($max_price !== '') {
        $query .= "AND r.price <= :max_price ";
    }
    if ($min_area !== '') {
        $query .= "AND r.area >= :min_area ";
    }
    if ($max_area !== '') {
        $query .= "AND r.area <= :max_area ";
    }

    if ($lat !== '' && $lng !== '') {
        $query .= "HAVING distance <= :radius ORDER BY distance ASC";
    } else {
        $query .= "ORDER BY r.created_at DESC";
    }

    $stmt = $db->prepare($query);
    $stmt->bindParam(':status', $status_filter);
    
    if ($location !== '') {
        $loc_param = "%$location%";
        $stmt->bindParam(':location', $loc_param);
    }
    if ($min_price !== '') {
        $stmt->bindParam(':min_price', $min_price);
    }
    if ($max_price !== '') {
        $stmt->bindParam(':max_price', $max_price);
    }
    if ($min_area !== '') {
        $stmt->bindParam(':min_area', $min_area);
    }
    if ($max_area !== '') {
        $stmt->bindParam(':max_area', $max_area);
    }
    if ($lat !== '' && $lng !== '') {
        $stmt->bindParam(':lat', $lat);
        $stmt->bindParam(':lng', $lng);
        $stmt->bindParam(':radius', $radius);
    }

    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        $rooms_arr = ["records" => []];
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            array_push($rooms_arr["records"], $row);
        }
        http_response_code(200);
        echo json_encode($rooms_arr);
    } else {
        http_response_code(404);
        echo json_encode(["message" => "No rooms found."]);
    }
} elseif ($method === 'POST') {
    $lessor_id = $_POST['lessor_id'] ?? '';
    $title = $_POST['title'] ?? '';
    $description = $_POST['description'] ?? '';
    $price = $_POST['price'] ?? '';
    $area = $_POST['area'] ?? '';
    $address = $_POST['address'] ?? '';
    $latitude = $_POST['latitude'] ?? 0;
    $longitude = $_POST['longitude'] ?? 0;
    
    $image_urls = [];
    if (isset($_FILES['images'])) {
        $total_files = count($_FILES['images']['name']);
        for ($i = 0; $i < $total_files; $i++) {
            if ($_FILES['images']['error'][$i] === UPLOAD_ERR_OK) {
                $uploadDir = 'uploads/';
                if (!is_dir($uploadDir)) {
                    mkdir($uploadDir, 0777, true);
                }
                $fileName = time() . '_' . basename($_FILES['images']['name'][$i]);
                $targetFilePath = $uploadDir . $fileName;
                if (move_uploaded_file($_FILES['images']['tmp_name'][$i], $targetFilePath)) {
                    $image_urls[] = 'api/' . $targetFilePath;
                }
            }
        }
    }
    
    $image_url_string = !empty($image_urls) ? implode(',', $image_urls) : 'no-image.jpg';

    if (!empty($title) && !empty($price) && !empty($address) && !empty($lessor_id)) {
        $query = "INSERT INTO room_listings SET lessor_id=:lessor_id, title=:title, description=:description, price=:price, area=:area, address=:address, latitude=:latitude, longitude=:longitude, image_url=:image_url, status='PENDING'";
        $stmt = $db->prepare($query);
        $stmt->bindParam(":lessor_id", $lessor_id);
        $stmt->bindParam(":title", $title);
        $stmt->bindParam(":description", $description);
        $stmt->bindParam(":price", $price);
        $stmt->bindParam(":area", $area);
        $stmt->bindParam(":address", $address);
        $stmt->bindParam(":latitude", $latitude);
        $stmt->bindParam(":longitude", $longitude);
        $stmt->bindParam(":image_url", $image_url_string);

        if ($stmt->execute()) {
            http_response_code(201);
            echo json_encode(["message" => "Đăng phòng thành công!"]);
        } else {
            http_response_code(503);
            echo json_encode(["message" => "Lỗi hệ thống."]);
        }
    }
} elseif ($method === 'PUT') {
    $data = json_decode(file_get_contents("php://input"));
    if (!empty($data->id) && !empty($data->status)) {
        $rejection_reason = isset($data->rejection_reason) ? $data->rejection_reason : null;
        
        $query = "UPDATE room_listings SET status = :status, rejection_reason = :rejection_reason WHERE id = :id";
        $stmt = $db->prepare($query);
        $stmt->bindParam(':status', $data->status);
        $stmt->bindParam(':rejection_reason', $rejection_reason);
        $stmt->bindParam(':id', $data->id);
        $stmt->execute();

        if ($data->status === 'REJECTED') {
            $msg = "Bài đăng của bạn đã bị từ chối. Lý do: " . $rejection_reason;
            $notif_query = "INSERT INTO notifications SET user_id = (SELECT lessor_id FROM room_listings WHERE id = :rid), message = :msg";
            $notif_stmt = $db->prepare($notif_query);
            $notif_stmt->bindParam(':rid', $data->id);
            $notif_stmt->bindParam(':msg', $msg);
            $notif_stmt->execute();
        }

        echo json_encode(["message" => "Cập nhật thành công."]);
    }
}
 elseif ($method === 'DELETE') {
    $data = json_decode(file_get_contents("php://input"));
    if (!empty($data->id)) {
        $query = "DELETE FROM room_listings WHERE id = :id";
        $stmt = $db->prepare($query);
        $stmt->bindParam(':id', $data->id);
        $stmt->execute();
        echo json_encode(["message" => "Đã xóa bài."]);
    }
}
?>