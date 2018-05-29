<?php
include_once 'include/lib/libPage.php';

class PageTest extends Page
{
    protected function afficherContent()
    {
        echo '<div class="message">';
        print_r($this->userInfo);
        echo '</div><br />';
        
        if(isset($_GET['stagiaire']))
        {
            $this->bdd->exec('UPDATE etudiant SET `en_activite` = 1');
        }
        
        if(isset($_GET['affiche']))
        {
            $reponse = $this->bdd->query('SHOW COLUMNS FROM etudiant');

            while ($donnees = $reponse->fetch())
            {
                echo '</br>';
                echo $donnees['Field'];
            }
        }
        
        if(isset($_GET['delete']))
        {
            $reponse = $this->bdd->exec("DELETE FROM entreprise WHERE num_entreprise IN (30)");
        }
        
        if(isset($_GET['insert']))
        {
            try
            {
                //$reponse = $this->bdd->exec("INSERT INTO etudiant(`nom_etudiant`, `prenom_etudiant`, `num_classe`, `num_spec`) VALUES ('Biernas', 'Norddine', 1, 1);");
            }
            catch(PDOException $e)
            {
                echo $e->getMessage();
            }
            echo 'marche bien ';
            echo $reponse;
        }
        
        if(isset($_GET['index']))
        {
            $reponse = $this->bdd->query("SELECT `AUTO_INCREMENT`
                FROM  INFORMATION_SCHEMA.TABLES
                WHERE TABLE_SCHEMA = 'geststages'
                AND   TABLE_NAME   = 'entreprise';");
            
            while($donnees = $reponse->fetch())
            {
                print_r($donnees);
            }
        }
        
        if(isset($_GET['spec_entreprise']))
        {
            $reponse = $this->bdd->query("SELECT * FROM spec_entreprise");
            
            while($donnees = $reponse->fetch())
            {
                print_r($donnees);
                echo '<br />';
            }
        }
    }
}

$page = new PageTest();
$page->run();

?>
