<?php
session_start();
include('../../includes/config/dbconn.php');


$uid=intval($_GET['uid']);

        $sql="DELETE FROM `articles` where `id` = $uid";

        if ($dbh->query($sql) === TRUE) {
            $_SESSION['success']="Article removed successfully!";
            header('location:../manage-articles.php');
        } else {
            header('location:../manage-articles.php');
        }

?>