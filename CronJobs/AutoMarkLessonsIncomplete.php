<?php
// Set up MySQL connection parameters

$host = '127.0.0.1';
$port = '8889';
$username = 'ActivityHub';
$password = "AH123";
$database = 'ActivityHub';

// $username = 'mgsmusicco_ActivityHub';
// $password = 'ActivityHub123';
// $database = 'mgsmusicco_ActivityHub';

$conn = new mysqli($host, $username, $password, $database, $port);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$dt = new DateTime("yesterday", new DateTimeZone('Pacific/Auckland'));

$yesterdayDate = $dt->format('Y-m-d');
$yesterdayDay = $dt->format('l');

$stmt = $conn->prepare("
    SELECT * 
    FROM lessons 
    WHERE status = 'Active' 
        AND day = ?
        AND deleted_at IS NULL 
        AND (
            NOT EXISTS (
                SELECT * 
                FROM lesson_attendance 
                WHERE lesson_attendance.lesson_id = lessons.id 
                    AND DATE(lesson_attendance.date) = ?
            )
            OR EXISTS (
                SELECT *
                FROM lesson_attendance
                WHERE lesson_attendance.lesson_id = lessons.id
                    AND DATE(lesson_attendance.date) = ?
                    AND lesson_attendance.attendance = 'pending'
            )
        )
    "
);
$stmt->bind_param("sss", $yesterdayDay, $yesterdayDate, $yesterdayDate);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    // Loop through each lesson with unmarked attendance
    while($row = $result->fetch_assoc()) {
        echo implode($row) . "\n";
        $id = guidv4();
        $lessonId = $row['id'];
        $lessonTime = $row['start'];
        $user_id = '82d6c63e-e637-423c-91e4-b9b7c3d01f76';
        $insertSql = "
            INSERT INTO `lesson_attendance`(`id`, `lesson_id`, `attendance`, `date`, `time`, `user_id`) 
            VALUES ('$id', '$lessonId', 'incomplete', '$yesterdayDate', '$lessonTime', '$user_id')";

        if ($conn->query($insertSql) === TRUE) {
            echo "Lesson with ID $lessonId marked as incomplete.\n";
        } else {
            echo "Error updating record: " . $conn->error;
        }
    }
} else {
    echo "No lessons with unmarked attendance found.";
}

// Close database connection
$conn->close();

function guidv4($data = null) {
    // Generate 16 bytes (128 bits) of random data or use the data passed into the function.
    $data = $data ?? random_bytes(16);
    assert(strlen($data) == 16);

    // Set version to 0100
    $data[6] = chr(ord($data[6]) & 0x0f | 0x40);
    // Set bits 6-7 to 10
    $data[8] = chr(ord($data[8]) & 0x3f | 0x80);

    // Output the 36 character UUID.
    return vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));
}
?>