<?php
 $url=$_GET['url'];
 $cID=$_GET['cID'];
 //echo "<iframe src='$url' style='width=100%; height=100%;' title='ejemplo'";

?>
<html>
<head>
<title>vista_apunte</title>
<style>
  #wrap {
  width: 90%;
  height: 90%;
  padding: 0;
  overflow: hidden;
}

#scaled-frame {
  width: 100%;
  height: 100%;
  border: 0px;
  
}

#scaled-frame {
  zoom: 0.8;
  -moz-transform: scale(0.8);
  -moz-transform-origin: 0 0;
  -o-transform: scale(0.8);
  -o-transform-origin: 0 0;
  -webkit-transform: scale(0.8);
  -webkit-transform-origin: 0 0;
}

@media screen and (-webkit-min-device-pixel-ratio:0) {
  #scaled-frame {
    zoom: 1;
  }
}
</style>
</head>
<body style="margin:0">
  <div id="wrap">
  <?php 
    echo "<iframe id='scaled-frame' src='$url' title='ejemplo'></iframe>";
  ?>
  
  </div>
  <?php
  echo "<a style='height:10%;width:10%; display:inline' href='apuntes.php?contenido_id=$cID'>VOLVER</a>"
  ?>
</body>
 



</html>