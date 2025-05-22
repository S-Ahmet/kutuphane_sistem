
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

    $sql = "SELECT * FROM uyeler WHERE email = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();

        echo "Veritabanından alınan kullanıcı verileri:<br>";
        var_dump($user); 

        if ($password === $user['sifre']) {

            header("Location: member-login.html"); 
            exit();
        } else {
          
            echo "E-posta veya şifre hatalı.";
        }
    } else {
      
        echo "E-posta veya şifre hatalı.";
    }
}


$conn->close();
?>
