<?php
// alimentation de l'interface :
$titre = "Nouvelle catégorie";

// récupération des catégories afin de permettre tous les contrôles côté client
$lesCategories = json_encode(Categorie::getListe());

$head = <<<HTML
<script>
    const lesCategories = $lesCategories;
</script>
HTML;

// chargement de l'interface
require RACINE . "/include/interface.php";

