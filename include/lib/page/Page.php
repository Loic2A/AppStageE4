<?php

include_once 'include/function/f_bdd.php';
include_once 'include/function/f_menu.php';

abstract class Page 
{
    private $menu;
    private $droitAdmin;
    private $connectionError;
    protected $userInfo;
    protected $bdd;
    
    public function __construct($droitAdmin = false)
    {
        session_start();
        $this->bdd = connexionBDD();
        
        $this->connectionError = "";
        $this->userInfo = null;
        $this->connectUser();
        
        $this->menu = makeMenu(false, $this->userIsConnect());
        $this->droitAdmin = $droitAdmin;
    }
    
    private function connectUser()
    {
        if(isset($_POST['login']) && isset($_POST['mdp']))
        {
            if($_SERVER['REMOTE_ADDR'] == '127.0.0.1')
            {
                $_SESSION['user_info'] = array(
                    'is_professeur' => true, 
                    'classe' => 'BTS SIO', 
                    'bts' => 'SIO', 
                    'login' => 'mazpie20', 
                    'prenom' => 'Pierre', 
                    'nom' => 'Mazan', 
                    'erreur' => '');
            }
            else
            {
                include 'include/api/apiLLB.php';
                
                $user = $_POST['login'];
                $password = $_POST['mdp'];
                $userInfo = auth($user, $password);
                $allowedUser = false;
                
                //if(isset($_POST['connection_admin']))
                //    $userInfo['is_professeur'] = true;
                
                if($userInfo['is_professeur'])
                    $allowedUser = true;
                else
                {
                    $reponse = $this->bdd->query('SELECT nom_classe FROM classe WHERE nom_classe LIKE "' . $userInfo['bts'] . '"');
                    
                    if($donnees = $reponse->fetch())
                    {
                        $allowedUser = true;
                    }
                }
                
                if($allowedUser)
                {
                    if($userInfo['erreur'] == "")
                    {
                        $_SESSION['user_info'] = $userInfo;
                        $this->userInfo = $userInfo;
                    }
                    else
                    {
                        $this->connectionError = $userInfo["erreur"];
                    }
                }
                else
                {
                    $this->connectionError = "Vous n'êtes pas autorisé à vous connecter à cette application";
                }
            }
        }

        if(isset($_SESSION['user_info']))
            $this->userInfo = $_SESSION['user_info'];
        
    }
    
    protected function userIsConnect()
    {
        return $this->userInfo != null;
    }
    
    public function run()
    {
        $errorCatch = "";
    
        if($this->userIsConnect() == true && $this->droitAdmin == false && $this->bdd != false)
        {
            try
            {
                $this->init();
            }
            catch(Exception $e)
            {
                $errorCatch .= $e->getMessage() . '<br />';
            }
        }
        
        $this->afficherTop();
        
        if(!$this->userIsConnect())
            $this->afficherDeconnecter();
        elseif($this->droitAdmin == true)
            $this->afficherErreurDroitAdmin();
        elseif($this->bdd == false)
            $this->afficherErreurBdd();
        else
        {
            try
            {
                $this->afficherContent();
            }
            catch(Exception $e)
            {
                $errorCatch .= $e->getMessage() . '<br />';
            }
        }
        
        if($errorCatch != "" && $this->userInfo['is_professeur'])
        {
            echo '<div class="message">' . $e->getMessage() . '</div>';
        }
        
            
        $this->afficherBottom();
    }
    
    protected function init() {}
    abstract protected function afficherContent();
    
    protected function havePostId()
    {
        return isset($_GET['id']);
    }
    
    protected function getPostId()
    {
        return intval($_GET['id']);
    }
    
    private function afficherErreurBdd()
    {
        ?>
        <div class="message">Erreur lors de la connexion à la base de données</div>
        <?php
    }
    
    private function afficherErreurDroitAdmin()
    {
        ?>
        <div class="message">Vous n'avez pas le droit d'accéder à cette page</div>
        <?php
    }
    
    private function afficherDeconnecter()
    {
        ?>
        <div class="message">
            <h1>Gestion des stages</h1>
            Vous n'êtes pas connecté.<br />
            Identifiez-vous pour poursuivre la navigation.
        </div>
        <br />
        
        <form action="" method="POST">
            <table class="connection">
                <tr>
                    <td><label for="login">Login : </label></td>
                    <td><input type="text" name="login" id="login" /></td>
                </tr>
                <tr>
                    <td><label for="mdp">Mot de passe : </label></td>
                    <td><input type="password" name="mdp" id="mdp" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" name="connection" value="Connexion" />
                        <!--<input type="submit" name="connection_admin" value="Mode Admin" />-->
                    </td>
                </tr>
                <?php
                if($this->connectionError != "")
                {
                    echo '<tr><td colspan="2"><br />Erreur : ' . $this->connectionError . '</td></tr>';
                }
                ?>
            </table>
        </form>
        
        <?php
    }
    
    private function afficherTop()
    {
        ?>
        <!DOCTYPE html>
        <html>
            <head>
                <meta charset="utf-8" />
                <title>
                    Stage BTS
                </title>
                <link rel="stylesheet" href="style/bouton.css">
                <link rel="stylesheet" href="style/formulaire.css">
                <link rel="stylesheet" href="style/general.css">
                <link rel="stylesheet" href="style/tableau.css">
            </head>
            <body <?php if($this->menu->isReduit()) echo 'class="reduit"'; ?>>
                <?php
                    $this->menu->afficher();
                ?>
                <div id="corps">
                    <section id="contenu">
        <?php
    }
    
    private function afficherBottom()
    {
        ?>
                    </section>
                </div>
                
                <?php $this->menu->appliquerScript(); ?>
            </body>
        </html>
        <?php
    }
    
    

}


?>