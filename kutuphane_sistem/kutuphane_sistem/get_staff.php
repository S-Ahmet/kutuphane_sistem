
<?php
header('Content-Type: application/json');
$conn = new mysqli("localhost", "root", "", "kutuphane_sistem");
if ($conn->connect_error) {
    die(json_encode(["error" => $conn->connect_error]));
}
$result = $conn->query("SELECT id, ad, soyad FROM personeller");
$data = [];
while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}
echo json_encode($data);
$conn->close();
?>
