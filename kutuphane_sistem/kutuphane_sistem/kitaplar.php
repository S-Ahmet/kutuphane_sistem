
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
    $sql = "SELECT * FROM kitaplar";
    $result = $conn->query($sql);
    echo '<table>';
    echo '<tr><th>Ad</th><th>Yazar</th><th>Tür</th><th>Durum</th><th>İşlem</th></tr>';
    while ($row = $result->fetch_assoc()) {
        $button = $row['durum'] === 'Mevcut' 
            ? '<button onclick="borrowBook(' . $row['id'] . ')">Ödünç Al</button>'
            : 'Mevcut Değil';   
        echo '<tr>';
        echo '<td>' . $row['ad'] . '</td>';
        echo '<td>' . $row['yazar'] . '</td>';
        echo '<td>' . $row['tur'] . '</td>';
        echo '<td>' . $row['durum'] . '</td>';
        echo '<td>' . $button . '</td>';
        echo '</tr>';
    }
    echo '</table>';
} elseif ($action === 'borrow') {
    $id = $_GET['id'];
    $sql = "UPDATE kitaplar SET durum='Ödünç Verildi' WHERE id=$id";
    if ($conn->query($sql) === TRUE) {
        echo "Kitap başarıyla ödünç alındı.";
    } else {
        echo "Hata: " . $conn->error;
    }
} elseif ($action === 'borrowed') {
    $sql = "SELECT * FROM kitaplar WHERE durum='Ödünç Verildi'";
    $result = $conn->query($sql);
    echo '<table>';
    echo '<tr><th>Ad</th><th>Yazar</th><th>Tür</th><th>İşlem</th></tr>';
    while ($row = $result->fetch_assoc()) {
        echo '<tr>';
        echo '<td>' . $row['ad'] . '</td>';
        echo '<td>' . $row['yazar'] . '</td>';
        echo '<td>' . $row['tur'] . '</td>';
        echo '<td><button class="green" onclick="returnBook(' . $row['id'] . ')">Teslim Et</button></td>';
        echo '</tr>';
    }
    echo '</table>';
} elseif ($action === 'return') {
    $id = $_GET['id'];
    $sql = "UPDATE kitaplar SET durum='Mevcut' WHERE id=$id";
    if ($conn->query($sql) === TRUE) {
        echo "Kitap başarıyla teslim edildi.";
    } else {
        echo "Hata: " . $conn->error;
    }
}
$conn->close();
?>
