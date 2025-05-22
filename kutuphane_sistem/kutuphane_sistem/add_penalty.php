
<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $uyeID = $_POST['uyeID'];
    $tur = $_POST['tur'];
    $gun = $_POST['gun'];

    $conn = new mysqli("localhost", "root", "", "kutuphane_sistem");
    if ($conn->connect_error) {
        die("Bağlantı hatası: " . $conn->connect_error);
    }

    $stmt = $conn->prepare("INSERT INTO ceza (uyeID, tur, gun) VALUES (?, ?, ?)");
    $stmt->bind_param("isi", $uyeID, $tur, $gun);

    if ($stmt->execute()) {
        echo "Ceza başarıyla eklendi.";
    } else {
        echo "Hata: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
}
?>
