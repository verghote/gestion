<?php
// récupération des catégories pour alimenter la zone de liste et le tableau des catégories
$lesCategories = json_encode(Categorie::getAll());

$head = <<<HTML
<script>
    const lesCategories = $lesCategories;
</script>
HTML;

// chargement de l'interface
require RACINE . "/include/interface.php";

