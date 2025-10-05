<?php
// contrôle de l'existence des paramètres attendus
if (!isset($_POST['idProjet']) ) {
    Erreur::envoyerReponse("Paramètre manquant", 'global');
}

if (!filter_var($_POST['idProjet'], FILTER_VALIDATE_INT) ) {
    Erreur::envoyerReponse("Paramètre invalide", 'global');
}

$idProjet = (int) $_POST['idProjet'];

// ajout de tous les droits pour cet administrateur,
Projet::ajouterToutesLesCompetences($idProjet);
echo json_encode(['success' => "Opération réalisée avec succès"], JSON_UNESCAPED_UNICODE);
