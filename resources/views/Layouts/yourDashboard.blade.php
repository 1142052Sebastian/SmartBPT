

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
  <!-- CSS Files -->
  <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="../assets/css/now-ui-dashboard.css?v=1.5.0" rel="stylesheet" />
</head>

  <body class="">
    <div class="wrapper ">
        <div class="sidebar" data-color="orange">
            @yield('sidebar')
        </div>
      <div class="main-panel" id="main-panel">

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-transparent  bg-primary  navbar-absolute">
            @yield('navbar')
        </nav>
        <!-- End Navbar -->

        {{-- index blue chart --}}
        <div class="panel-header panel-header-lg">
          <canvas id="bigDashboardChart"></canvas>
        </div>

        {{-- Main Page Content ( right ) --}}
        <div class="content">
            @yield('contents')
        </div>
     
        <footer class="footer">
            @yield('footer')
        </footer>
      </div>
    </div>

    <h1>Risultati della query:</h1>

    <div id="results"></div>

    <table>
      <tr>
        <td>'User_id'</td>
        <td>'User_name'</td>
        <td>'House_name'</td>
        <td>'Room_type'</td>
        <td>'Sensor_Id'</td>
        <td>'Data_value'</td>
        <td>'Data_pickTime'</td>
      </tr>
    </table>
<ul>

</ul>

    {{-- Query section  --}}


    <!--   Core JS Files   -->
    <script src="../assets/js/core/jquery.min.js"></script>
    <script src="../assets/js/core/popper.min.js"></script>
    <script src="../assets/js/core/bootstrap.min.js"></script>
    <script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>

    <!--  Google Maps Plugin    -->
    <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

    <!-- Chart JS -->
    <script src="../assets/js/plugins/chartjs.min.js"></script>
    <!--  Notifications Plugin    -->

    <script src="../assets/js/plugins/bootstrap-notify.js"></script>

    <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
    <script>
      //       $(document).ready(function() {
      //     $.ajax({
      //         url: "query.php",
      //         dataType: "json",
      //         success: function(data) {
      //             var results = $("#results");
      //             $.each(data, function(index, row) {
      //                 // Crea un elemento HTML per ogni riga dei risultati e aggiungilo all'elemento "results"
      //                 var item = $("<div>");
      //                 item.text(row.field1 + " " + row.field2);
      //                 results.append(item);
      //             });
      //         }
      //     });
      // });
      var user = {!! json_encode(Auth::user()) !!}
        fetch('http://localhost', {
          method: 'POST',
          body: JSON.stringify({
            userId: 3
          })
        })
        .then(response => response.json())
        .then(data => {
          console.log(data);
        })
        .catch(error => console.error(error));

      ;
    </script>
    <script src="../assets/js/now-ui-dashboard.min.js?v=1.5.0" type="text/javascript"></script><!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
    <script src="../assets/js/myFile.js"></script>
    <script>
      $(document).ready(function() {
        // Javascript method's body can be found in assets/js/demos.js

        mainboard.initDashboardPageCharts();

      });
    </script>

    
  </body>
</html>