<?php
function auth($user, $password) {
	$ldap_host = "172.16.150.100";
	$ldap_dn = "ou=People,dc=llb,dc=fr";
	$ldap = ldap_connect($ldap_host, 389);
    
    $res["login"] = "";
    $res["prenom"] = "";
    $res["nom"] = "";
    $res["is_professeur"] = false;
    $res["classe"] = "";
    $res["bts"] = "";
    $res["erreur"] = "";
            
    if($ldap){
        $bind = ldap_bind($ldap, "uid=".$user.",".$ldap_dn, $password);
        if($bind) {
            $search = ldap_search($ldap, "ou=People,dc=llb,dc=fr", "uid=".$user);
            $infos = ldap_get_entries($ldap, $search);
            
            for($i=0; $i<$infos["count"]; $i++) {
                $res["login"] = $infos[$i]["uid"][0];
                $res["nom"] = preg_replace('/_/', ' ', $infos[$i]["sn"][0]);
                $res["prenom"] = preg_replace('/_/', ' ', $infos[$i]["givenname"][0]);
            }

            $search_gr = ldap_search($ldap, "ou=Groups,dc=llb,dc=fr", "memberUid=".$user);
            $infos_gr = ldap_get_entries($ldap, $search_gr);

            for($i=0; $i<$infos_gr["count"]; $i++) 
            {
                $groupe = $infos_gr[$i]["cn"][0];
                $groupe_debut = substr($groupe, 0, 7);
                if ($groupe_debut == "Classe_") // Groupe étudiant
                {
                    $res["classe"] = substr($groupe, 7);
                    $res["bts"] = preg_replace('/([^a-zA-Z])/', '', $res["classe"]);;
                    $res["is_professeur"] = false;
                    $res["erreur"] = "";
			return $res;
                }
                else if ($groupe_debut == "Equipe_") // Groupe professeur
                {
                    $res["classe"] =  $groupe;
                    $res["bts"] = $groupe;
                    $res["is_professeur"] = true;
                    $res["erreur"] = "";
			return $res;
                }
                else 
                {
                    $res["erreur"] = "Votre groupe n'est pas reconnu";
                }
            }
        }
        else{
            $res["erreur"] = "Les identifiants fournis sont incorrects";
        } 
    }
    else{
        $res["erreur"] = "Serveur LDAP injoignable";
    }
    
    return $res;
}
?>
