<?php
// alimentation de l'interface
$titre = "Les coureurs d'une catégorie";

// récupération des catégories afin d'alimenter la liste déroulante
$lesCategories = json_encode(Categorie::getListe());

$head = <<<HTML
<script>
       const lesCategories = $lesCategories;
</script>
HTML;

// chargement de l'interface
require RACINE . "/include/interface.php";
