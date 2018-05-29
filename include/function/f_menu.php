<?php

function makeMenu($admin, $deconnection)
{
    $ongletAccueil = new Onglet('Accueil', 'index.php', 'onglet_accueil');
    $ongletEntreprise = new Onglet('Entreprise', 'listeEntreprise.php', 'onglet_entreprise');
    $ongletStagiaire = new Onglet('Stagiaire', 'listeStagiaire.php', 'onglet_stagiaire');
    $ongletInscription = new Onglet('Inscription', 'inscrireStagiaire.php', 'onglet_inscrire');
    $ongletAide = new Onglet('Aide', 'aide.php', 'onglet_aide');
    
    if($deconnection)
        $ongletDeconnection = new Onglet('Déconnexion', 'deconnexion.php', 'onglet_deconnection');

    $ongletEntreprise->addPage('inscrireEntreprise.php');
    $ongletEntreprise->addPage('rechercherEntreprise.php');
    $ongletEntreprise->addPage('infoEntreprise.php');

    $ongletStagiaire->addPage('rechercherStagiaire.php');
    $ongletStagiaire->addPage('infoStagiaire.php');

    $menu = new Menu();
    $menu->addOnglet($ongletAccueil);
    $menu->addOnglet($ongletEntreprise);
    $menu->addOnglet($ongletStagiaire);
    $menu->addOnglet($ongletInscription);
    $menu->addOnglet($ongletAide);
    
    if($deconnection)
        $menu->addOnglet($ongletDeconnection);
    
    return $menu;
}

?>