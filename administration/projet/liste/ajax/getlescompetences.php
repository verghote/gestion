<?php
// vérification du paramètre idProjet
// S'il n'est pas transmis, on envoie une erreur
if (!isset($_POST['idProjet'])) {
    Erreur::envoyerReponse("L'identifiant du projet n'est pas transmis.", 'global');
}

// récupération du paramètre
$idProjet = $_POST['idProjet'];

// contrôle du format du paramètre idProjet : seulement des chiffres
if (!preg_match('/^\d+$/', $idProjet)) {
    Erreur::envoyerReponse("L'identifiant du projet n'est pas valide.", 'global');
}

// Si le projet n'existe pas, on envoie une erreur
if (!Projet::getById($idProjet)) {
    Erreur::envoyerReponse("Ce projet n'existe pas.", 'global');
}

// récupération des compétences du projet et envoi de la réponse au format json
echo json_encode(Projet::getLesCompetences($idProjet));