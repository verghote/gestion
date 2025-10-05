<?php
// vérification des données attendues
if (!isset($_POST['idProjet']) || !filter_var($_POST['idProjet'], FILTER_VALIDATE_INT) ) {
    Erreur::envoyerReponse("Requête mal formulée");
}

if (!isset($_POST['idCompetence']) ) {
    Erreur::envoyerReponse("Requête mal formulée");
}

// récupération des données transmises
$idProjet = (int) $_POST["idProjet"];
$idCompetence = $_POST["idCompetence"];

// demande d'ajout d'un droit pour un administrateur
Projet::ajouterCompetence($idProjet, $idCompetence);

// réponse du serveur
echo json_encode(['success' => "Opération réalisée avec succès"], JSON_UNESCAPED_UNICODE);

