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

// envoi de la réponse
echo json_encode(Competence::getLesDomaines($idBloc));

