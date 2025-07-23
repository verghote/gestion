<?php
// alimentation de l'interface
$titre = "Filtrer sur plusieurs critères";

// alimentation des listes déroulantes
$lesCategories = json_encode(Categorie::getListe());
$lesClubs = json_encode(Club::getListe());
$lesCoureurs = json_encode(Coureur::getAll());

$head = <<<HTML
<script>
       const lesCategories = $lesCategories;
       const lesClubs = $lesClubs;
         const lesCoureurs = $lesCoureurs;
</script>
HTML;



// chargement de l'interface
require RACINE . "/include/interface.php";