<?php
include_once 'include/lib/libPage.php';

class PageRechercherStagiaire extends PageFormulaire
{
    protected function init()
    {
        $bdd = $this->bdd; 
		
        $fieldStagiaire = new Fieldset('Stagiaire');
        
		$inputSelectNomStagiaire = new InputSelectSQL("nom", "Nom", $this->bdd,
            "SELECT num_etudiant AS id, nom_etudiant AS name FROM etudiant WHERE en_activite = 1", true);
	    $inputSelectNomStagiaire->addRow("", "---");
		$inputSelectNomStagiaire->setContenu("");
		
        $inputSelectPrenomStagiaire = new InputSelectSQL("prenom", "Prénom", $this->bdd,
            "SELECT num_etudiant AS id, prenom_etudiant AS name FROM etudiant WHERE en_activite = 1", true);
		$inputSelectPrenomStagiaire->addRow("", "---");
		$inputSelectPrenomStagiaire->setContenu("");
			
        $inputSelectClasseStagiaire = new InputSelectSQL("classe", "Classe", $this->bdd,
            "SELECT DISTINCT classe.num_classe AS id, nom_classe AS name FROM etudiant JOIN classe ON etudiant.num_classe = classe.num_classe WHERE en_activite = 1", true);
		$inputSelectClasseStagiaire->addRow("", "---");
		$inputSelectClasseStagiaire->setContenu("");
		
		$inputSelectSpecialiteStagiaire = new InputSelectSQL("specialite", "Spécialité", $this->bdd,
        "SELECT DISTINCT specialite.num_spec AS id, libelle AS name FROM specialite", true);
		$inputSelectSpecialiteStagiaire->addRow("", "---");
		$inputSelectSpecialiteStagiaire->setContenu("");

        $fieldStagiaire->addInput($inputSelectNomStagiaire);
        $fieldStagiaire->addInput($inputSelectPrenomStagiaire);
        $fieldStagiaire->addInput($inputSelectClasseStagiaire);
		$fieldStagiaire->addInput($inputSelectSpecialiteStagiaire);
		
		$formulaire = new Formulaire('Rechercher','listeStagiaire.php');
        $formulaire->addFieldset($fieldStagiaire);
		
        $this->setFormulaire($formulaire);
    }
}

$page = new PageRechercherStagiaire();
$page->run();

?>
