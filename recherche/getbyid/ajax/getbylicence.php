<?php

// vérification de la transmission du paramètre attendu : licence
if (!isset($_POST['licence'])) {
    Erreur::envoyerReponse("Numéro de licence non transmis", 'licence');
}

// Récupération du coureur
$licence = $_POST['licence'];

// vérification du format de la licence
if (!preg_match('/^[0-9]{6,7}$/', $licence)) {
    Erreur::envoyerReponse("Numéro de licence non conforme", 'licence');
}

// Récupération du coureur
$ligne = Coureur::getByLicence($licence);
// Si le coureur n'existe pas, on envoie une erreur
if (!$ligne) {
    Erreur::envoyerReponse("Numéro de licence inexistant", 'licence');
}

// envoi de la réponse
echo json_encode($ligne);
