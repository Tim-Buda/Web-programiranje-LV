<?php 
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $email = $_POST['email'];
    $telephone = $_POST['telephone'];
    $start_date = $_POST['trip-start'];
    $end_date = $_POST['trip-end'];
    $apartman = $_POST['broj-apartmana'];
    $formcontent="Rezervirano od: $first_name $last_name \n Email: $email \n Mobitel: $telephone \n\n Od: $start_date do: $end_date \n u: $apartman";
    $recipient = "marko.budimir10@gmail.com";
    $subject = "Contact Form";
    $mailheader = "From: $email \r\n";
    mail($recipient, $subject, $formcontent, $mailheader) or die("Error!");
?>

<?php
    header('Location: index.php');
?>