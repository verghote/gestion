<?php
// Vérification de la transmission des paramètres
if (Std::existe('colonne', 'licence') === false) {
    Erreur::envoyerReponse("Paramètres manquants", 'global');
}

// récupération des paramètres
$colonne = $_POST['colonne'];
$licence = $_POST['licence'];

// Contrôle de la colonne
$lesColonnes = ['email', 'telephone'];
if (!in_array($colonne, $lesColonnes)) {
    Erreur::envoyerReponse("Requête invalide.", 'global');
}

// vérification du paramètre attendu
if (!preg_match('/^[0-9]{6,7}$/', $_POST['licence'])) {
    Erreur::envoyerReponse("Paramètre non transmis ou non valide", 'global');
}

// Effacement de la colonne
Coureur::clearColonne($colonne, $licence);

$reponse = ['success' => "Opération réalisée avec succès"];
echo json_encode($reponse, JSON_UNESCAPED_UNICODE);

