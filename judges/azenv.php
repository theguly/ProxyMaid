<?php
##########################################################################
#
#       AZ Environment variables 1.05 © 2024 AZ
#       Civil Liberties Advocacy Network
#       http://clan.cyaccess.com   http://clanforum.cyaccess.com
#
#       AZenv is written in PHP & Perl. It is coded to be simple,
#       fast and have negligible load on the server.
#       AZenv is primarily aimed for programs using external scripts to
#       verify the passed Environment variables.
#       Only the absolutely necessary parameters are included.
#       AZenv is free software; you can use and redistribute it freely.
#       Please do not remove the copyright information.
#
##########################################################################
if (isset($_GET["json"])) {
    header('Content-Type: application/json');
    $arr = array();
    foreach ($_SERVER as $header => $value ){
        if (strpos($header , 'REMOTE')!== false || strpos($header , 'HTTP')!== false || strpos($header , 'REQUEST') !== false) {
                $arr[$header] = $value;
        }
    }
    $json = json_encode($arr);

    echo $json;
    exit;
} else {
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>AZ Environment variables 1.05</title>
</head>
<body>
<pre>
<?php
foreach ($_SERVER as $header => $value ) {
    if (strpos($header , 'REMOTE')!== false || strpos($header , 'HTTP')!== false || strpos($header , 'REQUEST')!== false) {
        echo $header.' = '.$value."\n";
    }
}
}
?>
</pre>
</body>
</html>
