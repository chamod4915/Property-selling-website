<?php
session_start();
    include('../../includes/config/dbconn.php');
    if(isset($_POST['add']))
    {

      $fileName = $_FILES['file']['name'];
      $fileTmpName = $_FILES['file']['tmp_name'];
      $path = "uploads/".$fileName;

      $name=$_POST['name'];
      $content=$_POST['content'];

      $sql = "INSERT INTO articles(name, content, image) VALUES (?, ?, ?)";
      $query = $dbh->prepare($sql);
  
      $query->bindParam(1, $name);
      $query->bindParam(2, $content);
      $query->bindParam(3, $fileName);

      if ($query->execute()) {

        $lastInsertId = $dbh->lastInsertId();

        if($lastInsertId)
          {
            move_uploaded_file($fileTmpName,$path);
            $_SESSION['success']="Article added successfully!";
            header("Location: ../manage-articles.php");
          }  
          
          else{
              
            $_SESSION['error']="Unable to submit. Please check the details and try again";
            header("Location: ../add-article.php");
            
          }

        }
        else{
            header("Location: ../manage-articles.php");
        }
      }else{
        header("Location: ../manage-articles.php");
      }
?>