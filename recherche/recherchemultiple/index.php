<?php
// alimentation de l'interface
$titre = "Recherche sur plusieurs critères";

// alimentation des listes déroulantes
$lesCategories = json_encode(Categorie::getListe());
$lesClubs = json_encode(Club::getListe());

$head = <<<HTML
<script>
       const lesCategories = $lesCategories;
       const lesClubs = $lesClubs;
</script>
HTML;

// chargement de l'interface
require RACINE . "/include/interface.php";