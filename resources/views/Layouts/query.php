<?php
// Connessione al database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "TEST_SmartBPT";

$conn = new mysqli($servername, $username, $password, $dbname);

// Query SQL
$sql = "SELECT us.id,us.name,h.Name,r.Type,S.Id,SD.Value_Sensor,Sd.Mesured FROM `user` as us JOIN user_house as us_ho on (us.id=us_ho.id)join House as H on (us_ho.ID_House = h.Id) join Rooms as R on(r.Id_House = h.id) join Sensor as S on(s.Id_Room = R.Id) join sensor_data as SD on(SD.Id_Sensor = S.Id) where us.Id = $id";
$result = $conn->query($sql);

// Restituisci i risultati in formato JSON
$data = array();
while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}
echo json_encode($data);

// Chiudi la connessione al database
$conn->close();
?>
