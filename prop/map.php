<?php

session_start();
include('includes/config/dbconn.php');

$sql = "SELECT * FROM properties WHERE status='Approved';";
$stmt = $dbh->query($sql);

$properties = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Echo the properties in JSON format
echo '<script>';
echo 'var properties = ' . json_encode($properties) . ';';
echo '</script>';

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Property Listing</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap"
        rel="stylesheet">

    <!-- Icon Font -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries  -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!--  Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner -->
        <div id="spinner"
            class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>

        <!-- Header -->
        <?php include('includes/header.php'); ?>

        <!-- Headline -->
        <div class="container-fluid header bg-white p-0">
            <div class="row g-0 align-items-center flex-column-reverse flex-md-row">
                <div class="col-md-6 p-5 mt-lg-5">
                    <h1 class="display-5 animated fadeIn mb-4">Property Map</h1>
                    <nav aria-label="breadcrumb animated fadeIn">
                        <ol class="breadcrumb text-uppercase">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
                            <li class="breadcrumb-item text-body active" aria-current="page">Map</li>
                        </ol>
                    </nav>
                </div>
                <div class="col-md-6 animated fadeIn">
                    <img class="img-fluid" src="img/header.jpg" alt="">
                </div>
            </div>
        </div>

        <div class="container-xxl py-5">
            <div class="container">

            <script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBI7hQ4AOd1FT3tr5MtUmfYFMty12BsR0s&callback=initMap&libraries=maps,marker&v=beta"></script>

            <div id="map" style="width: 100%; height: 450px; padding-bottom: 20px;"></div>

            <script>
                function initMap() {
                    var map = new google.maps.Map(document.getElementById('map'), {
                        zoom: 14,
                        center: {lat: 6.821520805358887, lng: 80.04154968261719}
                    });

                    for (var i = 0; i < properties.length; i++) {
                        var property = properties[i];
                        var marker = new google.maps.Marker({
                            position: {lat: parseFloat(property.latitude), lng: parseFloat(property.longitude)},
                            map: map
                        });

                        (function (property) {
                            var contentString = '<div id="content">' +
                                '<div id="siteNotice">' +
                                '</div>' +
                                '<h3 id="firstHeading" class="firstHeading">' + property.name + '</h3>' +
                                '<div id="bodyContent">' +
                                '<img src="admin/includes/uploads/' + property.image + '" style="max-width:200px;max-height:200px;margin-bottom:10px;">' +
                                '<p><b>Price:</b> LKR ' + property.price + '</p>' +
                                '<p><b>Square Feet:</b> ' + property.squarefeet + ' Sqft</p>' +
                                '<p><b>Address:</b> ' + property.address + '</p>' +
                                '<p><b>No of Bedrooms:</b> ' + property.nobeds + '</p>' +
                                '<p><b>No of Bathrooms:</b> ' + property.nobathrooms + '</p>' +
                                '</div>' +
                                '</div>';

                            var infoWindow = new google.maps.InfoWindow({
                                content: contentString
                            });

                            marker.addListener('click', function () {
                                infoWindow.open(map, this);
                            });
                        })(property);
                            }
                        }
            </script>

                <!-- Footer -->
                <div
                    class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">

                    <div class="text-white mb-3 mb-md-0">
                        Copyright © 2024. Developed by Group I Students.
                    </div>

                    <div>
                        <a href="#!" class="text-white me-4">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="#!" class="text-white me-4">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="#!" class="text-white me-4">
                            <i class="fab fa-google"></i>
                        </a>
                        <a href="#!" class="text-white">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                    </div>
                </div>


                <!-- Back to Top -->
                <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
            </div>

            <!-- JavaScript Libraries -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="lib/wow/wow.min.js"></script>
            <script src="lib/easing/easing.min.js"></script>
            <script src="lib/waypoints/waypoints.min.js"></script>
            <script src="lib/owlcarousel/owl.carousel.min.js"></script>
            <script src="js/main.js"></script>

</body>

</html>