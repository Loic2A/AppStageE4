<?php

function connexionBDD()
{
	try
	{
		$bdd = new PDO('mysql:host=localhost;port=3306;dbname=geststagesE4;charset=utf8', 'root', 'mdpbdd', array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
        
        return $bdd;
	}
	catch(Exception $e)
	{
		$pdo_error = $e->getMessage();
	}
    
    return false;
}

?>
