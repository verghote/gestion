<?php
// alimentation de l'interface
$titre = "Consultation des projets";

// récupération de tous les projets
$lesProjets = Projet::getAll();

// Si aucun projet n'est enregistré dans la base de données, on redirige vers la page /erreur/erreur.php
if (count($lesProjets) === 0) {
   Erreur::afficherReponse("Aucun projet n'est enregistré dans la base de données.", 'global');
}

$lesProjets = json_encode($lesProjets);

$head = <<<HTML
    <script>
        const lesProjets = $lesProjets;
    </script>
HTML;

// chargement de l'interface
require RACINE . "/include/interface.php";
