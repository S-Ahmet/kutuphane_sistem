
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "kutuphane_sistem";


$conn = new mysqli($servername, $username, $password, $dbname);


if ($conn->connect_error) {
    die("Bağlantı hatası: " . $conn->connect_error);
}


$sql = "SELECT uyeler.ad, uyeler.soyad, ceza.tur, 
        DATE_ADD(CURRENT_DATE, INTERVAL ceza.gun DAY) AS bitisTarihi 
        FROM ceza 
        JOIN uyeler ON ceza.uyeID = uyeler.id";
$result = $conn->query($sql);

$data = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}


header('Content-Type: application/json');
echo json_encode($data);

$conn->close();
?>
