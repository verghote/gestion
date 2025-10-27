<?php
// contrôle de l'existence des paramètres attendus
if (!isset($_POST['idProjet']) || !filter_var($_POST['idProjet'], FILTER_VALIDATE_INT) ) {
    Erreur::envoyerReponse("Requête mal formulée");
}

$idProjet = intval($_POST['idProjet']);

// suppression de tous les droits de l'administrateur, il reste cependant considéré comme administrateur
Projet::supprimerToutesLesCompetences($idProjet);
echo json_encode(['success' => "Opération réalisée avec succès"], JSON_UNESCAPED_UNICODE);
