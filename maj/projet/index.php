<?php
// alimentation de l'interface
$titre = "Gestion des projets";

// récupération de tous les projets
$lesProjets = Projet::getAll();

if (count($lesProjets) === 0) {
    Erreur::afficherReponse("Aucun projet n'est enregistré dans la base de données.", 'global');
} else {
    $lesProjets = json_encode($lesProjets);
}

$head = <<<HTML
<script>
    const lesProjets =  $lesProjets;
</script>
HTML;

// chargement de l'interface
require RACINE . "/include/interface.php";

