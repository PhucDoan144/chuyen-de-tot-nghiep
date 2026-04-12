<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once 'config/database.php';

$database = new Database();
$db = $database->getConnection();
$data = json_decode(file_get_contents("php://input"));
$action = $_GET['action'] ?? '';

if ($action === 'register') {
    if (!empty($data->username) && !empty($data->password) && !empty($data->phone)) {
        $query = "INSERT INTO users SET username=:username, password_hash=:password_hash, phone=:phone, role=:role";
        $stmt = $db->prepare($query);
        $password_hash = password_hash($data->password, PASSWORD_BCRYPT);
        $role = isset($data->role) ? $data->role : 'LESSEE';

        $stmt->bindParam(":username", $data->username);
        $stmt->bindParam(":password_hash", $password_hash);
        $stmt->bindParam(":phone", $data->phone);
        $stmt->bindParam(":role", $role);

        if ($stmt->execute()) {
            http_response_code(201);
            echo json_encode(["message" => "User was created."]);
        } else {
            http_response_code(503);
            echo json_encode(["message" => "Unable to create user."]);
        }
    } else {
        http_response_code(400);
        echo json_encode(["message" => "Incomplete data."]);
    }
} elseif ($action === 'login') {
    $query = "SELECT id, username, password_hash, role FROM users WHERE username = ? LIMIT 0,1";
    $stmt = $db->prepare($query);
    $stmt->bindParam(1, $data->username);
    $stmt->execute();
    $num = $stmt->rowCount();

    if ($num > 0) {
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        if (password_verify($data->password, $row['password_hash'])) {
            http_response_code(200);
            echo json_encode([
                "message" => "Successful login.",
                "user" => [
                    "id" => $row['id'],
                    "username" => $row['username'],
                    "role" => $row['role']
                ]
            ]);
        } else {
            http_response_code(401);
            echo json_encode(["message" => "Login failed. Incorrect password."]);
        }
    } else {
        http_response_code(401);
        echo json_encode(["message" => "Login failed. User not found."]);
    }
}
?>