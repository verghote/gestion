<?php

// alimentation de l'interface
$titre = "Liste des annonces";

// Récupération des catégories avec l'intervalle des années
$lesAnnonces = json_encode(Annonce::getLesAnnoncesActives());

$head = <<<HTML
    <script>
        const lesAnnonces = $lesAnnonces;
    </script>
HTML;

// chargement de l'interface
require RACINE . "/include/interface.php";
