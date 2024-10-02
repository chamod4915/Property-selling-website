<?php

session_start();
include('../../includes/config/dbconn.php');
    if(isset($_POST['update']))
    {

      $uid=intval($_GET['uid']);
      $name=$_POST['name'];
      $content=$_POST['content'];
      $files=$_FILES['file']['name'];

      if($files) {

        $fileName = $_FILES['file']['name'];
        $fileTmpName = $_FILES['file']['tmp_name'];
        $path = "uploads/".$fileName;
        move_uploaded_file($fileTmpName,$path);

        $image = $fileName;

        $sql = "UPDATE articles SET name=:name, content=:content, image=:image WHERE id=:uid";
        $query = $dbh->prepare($sql);
        $query->bindParam(':name', $name, PDO::PARAM_STR);
        $query->bindParam(':content', $content, PDO::PARAM_STR);
        $query->bindParam(':image', $image, PDO::PARAM_STR);
        $query->bindParam(':uid', $uid, PDO::PARAM_INT);

    } else {
        $sql = "UPDATE articles SET name=:name, content=:content WHERE id=:uid";
        $query = $dbh->prepare($sql);
        $query->bindParam(':name', $name, PDO::PARAM_STR);
        $query->bindParam(':content', $content, PDO::PARAM_STR);
        $query->bindParam(':uid', $uid, PDO::PARAM_INT);
    }
  

      $query->execute();

      if($query->execute())
      {
        $_SESSION['success']="Article details updated successfully!";
        header("Location: ../manage-articles.php");
      }  
      
      else{
          
        $_SESSION['error']="Unable to update. Please check the details and try again";
        header("Location: ../manage-articles.php");
        
      }

    }
    else{
        header("Location: ../manage-articles.php");
    }

?>