<?php
// vérification de la transmission des paramètres attendus idProjet et lesCompetences
if (!Std::existe('nom', 'lesCompetences')) {
    Erreur::envoyerReponse('Requête invalide, des paramètres manquent.', 'global');
}

// récupération et filtrage des paramètres
$nom = trim(($_POST['nom']));

// supprimer toutes les balises HTML et PHP
$nom = strip_tags($nom);

// récupération des compétences dans un tableau
$lesCompetences = json_decode($_POST['lesCompetences'], true);

// si la conversion échoue, les compétences transmises ne respectent pas le format attendu
if (is_null($lesCompetences)) {
    Erreur::envoyerReponse('Le format de transmission des compétences n\'est pas conforme', 'global');
}

// il faut avoir transmis au moins une compétence
if (count($lesCompetences) === 0) {
    Erreur::envoyerReponse('Le projet doit posséder au moins une compétence', 'global');
}

// Le nom du projet doit être renseigné
if (empty($nom)) {
    Erreur::envoyerReponse('Le nom du projet doit être renseigné', 'nom');
}

// les autres contrôles sont mis en place dans les déclencheurs de la base de données

// enregistrement du projet
$reponse = Projet::enregistrer($nom, $lesCompetences);
if ($reponse === "Opération réalisée avec succès") {
    echo json_encode($reponse);
} else {
    Erreur::envoyerReponse($reponse);
}
