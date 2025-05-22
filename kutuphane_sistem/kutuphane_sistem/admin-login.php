
<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "kutuphane_sistem";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Bağlantı başarısız: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];

    $email = mysqli_real_escape_string($conn, $email);
    $password = mysqli_real_escape_string($conn, $password);

    $sql = "SELECT * FROM yoneticiler WHERE email = ? AND sifre = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $email, $password); 
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
 
        header("Location: admin-login.html"); 
        exit();
    } else {
       
        echo "E-posta veya şifre hatalı.";
    }
}


$conn->close();
?>
