<?php
// Récupération des catégories avec l'intervalle des années
$lesCategories = json_encode(Categorie::getAll());

$head = <<<HTML
    <script>
        const lesCategories = $lesCategories;
    </script>
HTML;

// chargement de l'interface
require RACINE . "/include/interface.php";
