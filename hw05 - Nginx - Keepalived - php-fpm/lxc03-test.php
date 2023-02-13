<?php
$hostname = '10.0.3.105';
$dbname = 'mybase';
$username = 'my_user';
$password = 'my_pass';

$thisWebServer = $_SERVER['SERVER_ADDR'];


$conn = mysqli_connect($hostname, $username, $password, $dbname);

if (!$conn) { die("Connection failed:" . mysql_connect_error());}

print "Connection with database <strong>$dbname</strong> at mysql server <strong>$hostname</strong> successfuly<br/>";

print "Virtual IP-address this server is: <strong>$thisWebServer</strong><br/>";
print "Real IP-address this server is: <strong>10.10.3.103</strong><br/>";
$query = 'SELECT * FROM `Time` order by id desc limit 10';
$result = mysqli_query($conn, $query);

echo "<table>\n";
while ($line = mysqli_fetch_array($result)) {
            echo "\t<tr>\n";
         //   foreach ($line as $col_value) {
            echo "\t\t<td>$line[0] $line[1]</td>\n";
         //       }
            echo "\t</tr>\n";
             }
            echo "</table>\n";


?>
