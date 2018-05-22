<html>
<?php

ini_set('display_startup_errors', 1);
ini_set('display_errors', 1);
error_reporting(-1);

echo 'Current PHP version: ' . phpversion();

$str = file_get_contents('./database.json');
$json = json_decode($str, true);
echo '<pre>' . print_r($json, true) . '</pre>';

$username = $json['production']['username'];
$password = $json['production']['password'];
$hostname = $json['production']['hostname'];
$dbname = $json['production']['dbname'];


//$username = "acloudguru";
//$password = "acloudguru";
//$hostname = "<insert RDS endpoint url here>";
//$dbname = "acloudguru";


//connection to the database
$dbhandle = mysql_connect($hostname, $username, $password)
  or die("Unable to connect to MySQL");
echo "Connected to MySQL using username - $username, password - $password, host - $hostname<br>";
$selected = mysql_select_db("$dbname",$dbhandle)
  or die("Could not select database");
echo "Connected to Database - $dbname";

?>
</html>