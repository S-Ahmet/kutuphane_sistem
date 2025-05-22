

<?php
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $servername = "localhost"; 
    $username = "root";        
    $password = "";            
    $dbname = "kutuphane_sistem";

    
    $personelID = $_POST['personelID'] ?? '';
    $leaveStart = $_POST['leaveStart'] ?? '';
    $leaveEnd = $_POST['leaveEnd'] ?? '';

   
    if (!$personelID || !$leaveStart || !$leaveEnd) {
        echo "Lütfen tüm alanları doldurun.";
        exit;
    }

   
    $conn = new mysqli($servername, $username, $password, $dbname);

    
    if ($conn->connect_error) {
        die("Bağlantı hatası: " . $conn->connect_error);
    }

    
    $sql = "INSERT INTO izin (personelID, izinBaslangicTarihi, izinBitisTarihi)
            VALUES ('$personelID', '$leaveStart', '$leaveEnd')";

    if ($conn->query($sql) === TRUE) {
        echo "İzin başarıyla eklendi.";
    } else {
        echo "Hata: " . $conn->error;
    }

    $conn->close();
} else {
    echo "Geçersiz istek.";
}
?>
