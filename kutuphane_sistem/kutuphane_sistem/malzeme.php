
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "kutuphane_sistem";

// Veritabanı bağlantısı
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Bağlantı başarısız: " . $conn->connect_error);
}

$action = $_GET['action'] ?? '';

if ($action === 'list') {
    $sql = "SELECT * FROM malzemeler";
    $result = $conn->query($sql);

    echo '<table>';
    echo '<tr><th>Ürün Adı</th><th>Stok Miktarı</th><th>İşlemler</th></tr>';
    while ($row = $result->fetch_assoc()) {
        echo '<tr>';
        echo '<td>' . htmlspecialchars($row['urun_adi']) . '</td>';
        echo '<td>' . (int)$row['stok_miktari'] . '</td>';
        echo '<td>
            <button class="green" onclick="updateMaterial(' . (int)$row['id'] . ', \'take\')">Al</button>
            <button class="red" onclick="updateMaterial(' . (int)$row['id'] . ', \'leave\')">Bırak</button>
        </td>';
        echo '</tr>';
    }
    echo '</table>';
} elseif ($action === 'take' || $action === 'leave') {
    $id = (int)$_GET['id'];
    $change = $action === 'take' ? -1 : 1;

    $sql = "UPDATE malzemeler SET stok_miktari = stok_miktari + $change WHERE id = $id AND stok_miktari + $change >= 0";
    if ($conn->query($sql) === TRUE) {
        echo "Stok miktarı başarıyla güncellendi.";
    } else {
        echo "Hata: " . $conn->error;
    }
}

$conn->close();
?>
