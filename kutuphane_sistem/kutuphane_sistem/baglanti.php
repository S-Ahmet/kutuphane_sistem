
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "kutuphane_sistem";

// Veritabanı bağlantısı
$conn = new mysqli($servername, $username, $password, $dbname);

// Bağlantı kontrolü
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
?>
