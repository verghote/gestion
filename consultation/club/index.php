<?php

// alimentation de l'interface
$titre = "Liste des clubs";

// récupération des clubs
$lesClubs = json_encode(Club::getAll());

$head = <<<HTML
    <script>
        const lesClubs = $lesClubs ;
    </script>
HTML;

// chargement de l'interface
require RACINE . "/include/interface.php";
