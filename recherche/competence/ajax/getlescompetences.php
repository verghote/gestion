<?php
// vérification de la transmission du paramètre idBloc
if (!isset($_POST['idBloc'])) {
    Erreur::envoyerReponse("L'identifiant du bloc n'a pas été transmis.", 'global');
}

// récupération du bloc
$idBloc = $_POST['idBloc'];

// S'il n'est pas numérique, on envoie une erreur
if (!preg_match("/[0-9]+/", $idBloc)) {
    Erreur::envoyerReponse("L'identifiant du bloc n'est pas valide.", 'global');
}

// le second paramètre idDomaine n'est pas obligatoire
$idDomaine = isset($_POST['idDomaine']) ? $_POST['idDomaine'] : '*';

// S'il n'est pas numérique et différent de *, on envoie une erreur
if (!preg_match("/[0-9]+/", $idDomaine) && $idDomaine !== '*') {
    Erreur::envoyerReponse("L'identifiant du domaine n'est pas valide.", 'global');
}

// envoi de la réponse
echo json_encode(Competence::getLesCompetences($idBloc, $idDomaine));


