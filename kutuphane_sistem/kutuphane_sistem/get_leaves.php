
<?php
header('Content-Type: application/json');

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "kutuphane_sistem";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    echo json_encode(["error" => $conn->connect_error]);
    exit;
}

$sql = "SELECT personeller.ad, personeller.soyad, izin.izinBaslangicTarihi, izin.izinBitisTarihi
        FROM izin
        INNER JOIN personeller ON izin.personelID = personeller.id";

$result = $conn->query($sql);

$data = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

echo json_encode($data);

$conn->close();
?>
