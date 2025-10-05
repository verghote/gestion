<?php
// alimentation de l'interface
$titre = "Consultation des projets";

// récupération de tous les projets
$lesProjets = Projet::getAll();

// Si aucun projet n'est enregistré dans la base de données, on redirige vers la page d'ajout d'un projet
if (count($lesProjets) === 0) {
    header('Location:/administration/projet/ajout/');
    exit;
}

$lesProjets = json_encode($lesProjets);

$head = <<<HTML
    <script>
        const lesProjets = $lesProjets;
    </script>
HTML;

// chargement de l'interface
require RACINE . "/include/interface.php";
