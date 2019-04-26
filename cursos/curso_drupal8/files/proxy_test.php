<?php
header('Content-Type: text/plain');
$srvaddr = htmlspecialchars($_SERVER['SERVER_ADDR']);
$srvremote = htmlspecialchars($_SERVER['REMOTE_ADDR']);
$srvfwdf = htmlspecialchars($_SERVER['HTTP_X_FORWARDED_FOR']);
echo "Server IP: ".$srvaddr;
echo "\nClient IP: ".$srvremote;
echo "\nX-Forwarded-for: ".$srvfwdf;
?>
