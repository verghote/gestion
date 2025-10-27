<?php
// vérification des données attendues
if (!isset($_POST['idProjet']) ) {
    Erreur::envoyerReponse("Paramètre manquant", 'global');
}

if (!filter_var($_POST['idProjet'], FILTER_VALIDATE_INT) ) {
    Erreur::envoyerReponse("Paramètre invalide", 'global');
}

if (!isset($_POST['idCompetence']) ) {
    Erreur::envoyerReponse("Requête mal formulée");
}

// récupération des données transmises
$idProjet = intval($_POST["idProjet"]);
$idCompetence = $_POST["idCompetence"];

// demande de suppression du droit d'accès
Projet::supprimerCompetence($idProjet, $idCompetence);

// réponse du serveur
echo json_encode(['success' => "Opération réalisée avec succès"], JSON_UNESCAPED_UNICODE);
