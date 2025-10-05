<?php
// Contrôle de la transmission du paramètre attendu : id
if (!isset($_GET['id']) ) {
    Erreur::afficherReponse("Le numéro du projet n'est pas transmis", 'global');
}

// Contrôle du format de l'identifiant : un entier
$id = filter_var($_GET['id'], FILTER_VALIDATE_INT);
if ($id === false) {
    Erreur::afficherReponse("La valeur transmise n'est pas du type attendu", 'system');
}

// Contrôle de la validité de l'identifiant : doit être présent dans la table annonce
$ligne = Projet::getById($id);
if (!$ligne) {
    Erreur::afficherReponse("Ce projet n'existe pas", 'global');
}

// alimentation de l'interface

// nom du projet concerné
$projet = json_encode($ligne);

// récupération de toutes les compétences du bloc 1 pour générer les cases à cocher
$lesCompetencesBloc1 = json_encode(Competence::getLesCompetences(1));

// récupération des compétences du projet
$lesIdCompetencesProjet = json_encode(Projet::getLesIdCompetences($id));

// chargement des ressources spécifiques de l'interface :tinyMce, dateFr pour le calendrier

$head = <<<HTML
    <script>
        const projet  = $projet;
        const lesCompetencesBloc1 = $lesCompetencesBloc1;
        const lesIdCompetencesProjet = $lesIdCompetencesProjet;
    </script>
HTML;

// chargement de la page
require RACINE . '/include/interface.php';

