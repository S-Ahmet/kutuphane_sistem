
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "kutuphane_sistem";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Bağlantı başarısız: " . $conn->connect_error);
}

$action = $_GET['action'] ?? '';
if ($action === 'list') {
    $sql = "SELECT * FROM mola";
    $result = $conn->query($sql);

    echo '<table>';
    echo '<tr><th>Mola Numarası</th><th>Mola Adı</th><th>İşlem</th></tr>';
    while ($row = $result->fetch_assoc()) {
        echo '<tr>';
        echo '<td>' . $row['MolaID'] . '</td>';
        echo '<td>' . $row['MolaAdi'] . '</td>';
        echo '<td><button onclick="takeBreak(' . $row['MolaID'] . ')">Mola Al</button></td>';
        echo '</tr>';
    }
    echo '</table>';
} elseif ($action === 'take') {

    $id = $_GET['id'];
    $sql = "UPDATE mola SET aktif = !aktif WHERE MolaID=$id";
    if ($conn->query($sql) === TRUE) {
        echo "Mola alındı.";
    } else {
        echo "Hata: " . $conn->error;
    }
}

$conn->close();
?>
