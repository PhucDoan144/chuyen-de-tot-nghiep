<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

include_once 'config/database.php';

$database = new Database();
$db = $database->getConnection();
$method = $_SERVER['REQUEST_METHOD'];
$action = isset($_GET['action']) ? $_GET['action'] : '';

if ($method === 'GET') {
    $user_id = isset($_GET['user_id']) ? $_GET['user_id'] : '';
    
    if ($action === 'get_notifications') {
        $query = "SELECT * FROM notifications WHERE user_id = :user_id ORDER BY created_at DESC";
        $stmt = $db->prepare($query);
        $stmt->bindParam(':user_id', $user_id);
        $stmt->execute();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($data);
    } 
    elseif ($action === 'get_messages') {
        $room_id = isset($_GET['room_id']) ? $_GET['room_id'] : '';
        $query = "SELECT m.*, u.username as sender_name 
                  FROM messages m 
                  JOIN users u ON m.sender_id = u.id 
                  WHERE m.room_id = :room_id ORDER BY m.created_at ASC";
        $stmt = $db->prepare($query);
        $stmt->bindParam(':room_id', $room_id);
        $stmt->execute();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($data);
    }
} elseif ($method === 'POST') {
    $data = json_decode(file_get_contents("php://input"));
    
    if ($action === 'send_message') {
        $query = "INSERT INTO messages SET sender_id=:s, receiver_id=:r, room_id=:rm, message_text=:m";
        $stmt = $db->prepare($query);
        $stmt->bindParam(':s', $data->sender_id);
        $stmt->bindParam(':r', $data->receiver_id);
        $stmt->bindParam(':rm', $data->room_id);
        $stmt->bindParam(':m', $data->message_text);
        if($stmt->execute()) {
            echo json_encode(["message" => "Thành công"]);
        } else {
            http_response_code(500);
            echo json_encode(["message" => "Lỗi"]);
        }
    } elseif ($action === 'mark_notifications_read') {
        $query = "UPDATE notifications SET is_read = 1 WHERE user_id = :u";
        $stmt = $db->prepare($query);
        $stmt->bindParam(':u', $data->user_id);
        $stmt->execute();
        echo json_encode(["message" => "Thành công"]);
    } elseif ($action === 'submit_report') {
        $query_admin = "SELECT id FROM users WHERE UPPER(role) = 'ADMIN'";
        $stmt_admin = $db->prepare($query_admin);
        $stmt_admin->execute();
        
        $msg = "Cảnh báo vi phạm: Bài đăng ID " . $data->room_id . " bị báo cáo với lý do [" . $data->report_type . "]";
        $query_notif = "INSERT INTO notifications (user_id, message) VALUES (:u, :m)";
        $stmt_notif = $db->prepare($query_notif);
        
        while ($row = $stmt_admin->fetch(PDO::FETCH_ASSOC)) {
            $stmt_notif->execute([':u' => $row['id'], ':m' => $msg]);
        }
        echo json_encode(["message" => "Thành công"]);
    }
}
?>