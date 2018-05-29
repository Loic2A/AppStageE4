<?php
include_once 'include/lib/libPage.php';

class PageModifierSpeEtu extends PageFormulaire
{
	private $reponse;
	
    protected function init()
    {
		$inputSelectEtudiant = new InputSelectSQL("num_etudiant", "Etudiant", $this->bdd,
            "SELECT num_etudiant AS id, CONCAT_WS(' ', prenom_etudiant, nom_etudiant) AS name FROM etudiant");

		$inputSelectClasse = new inputSelectSQL("num_classe", "Classe", $this->bdd, 
			"SELECT num_classe AS id, CONCAT_WS(' ',nom_classe) AS name FROM classe");

		$inputSelectSpecialite = new InputSelectSQL("num_spec", "Specialite", $this->bdd, 
			"SELECT num_spec AS id, CONCAT_WS(' ', libelle) AS name FROM specialite");
				
        $fieldEtudiant = new Fieldset('Nom Prenom');
        $fieldEtudiant->addInput($inputSelectEtudiant);

		$fieldClasse = new Fieldset ('Classe');
		$fieldClasse->addInput($inputSelectClasse);

		$fieldSpecialite = new Fieldset ('Specialite');
		$fieldSpecialite->addInput($inputSelectSpecialite);

		if($this->havePostId())
		{
			$inputSelectEtudiant->setContenu($this->getPostId());

			$req = $this->bdd->prepare(
				'SELECT num_classe, num_spec 
				FROM etudiant
				WHERE num_etudiant = ?');
			
			if($req->execute(array($this->getPostId())))
			{
				$resultat = $req->fetch();
				$idClasse = $resultat['num_classe'];
				$idSpecialite = $resultat['num_spec'];

				$inputSelectClasse->setContenu($idClasse);
				$inputSelectSpecialite->setContenu($idSpecialite);
			}
		}
	
        $formulaire = new Formulaire('Modifier');
        $formulaire->addFieldset($fieldEtudiant);
        $formulaire->addFieldset($fieldClasse);
        $formulaire->addFieldset($fieldSpecialite);
		
		$this->setFormulaire($formulaire);
		
		if($formulaire->check() && $this->havePostFormulaire())
		{
			$num_etudiant = $formulaire->getSafeContenu('num_etudiant');
			$num_classe = $formulaire->getSafeContenu('num_classe');
			$num_spec = $formulaire->getSafeContenu('num_spec');

			$req = $this->bdd->prepare('UPDATE etudiant SET `num_classe` = ?, `num_spec` = ? WHERE num_etudiant = ?');
			$this->reponse = $req->execute(array($num_classe, $num_spec, $num_etudiant));
		}
    }
    
	protected function afficherResultat()
	{
		if(isset($this->reponse) && $this->reponse == 1)
		{
			echo "Le profil a bien ete modifier";
			header('Location: listeStagiaire.php');
			exit;
		}
	}
}

$page = new PageModifierSpeEtu();
$page->run();

?>
