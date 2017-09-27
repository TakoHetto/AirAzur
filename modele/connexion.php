<?php
require ("modele/config.php");

function connect() {
	try {
		$connect = new PDO ('mysql:host='.HOTE.';dbname='.BASE,USER,PASSWORD, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
		$connect->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
		return $connect;
	}
	catch(PDOException $e) {
		echo "Problème de connexion". $e->getMessage();
		return false;
	}
}
?>