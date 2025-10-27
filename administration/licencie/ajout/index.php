<?php
// récupérer les clubs pour alimenter la zone de liste des clubs
$lesClubs = json_encode(Club::getListe());

// récupération de l'intervalle des dates de naissance possible
$dateMin = json_encode(Categorie::getDateNaissanceMin());
$dateMax = json_encode(Categorie::getDateNaissanceMax());

$head = <<<HTML
<script>
    const lesClubs = $lesClubs;
    const dateMin = $dateMin;
    const dateMax = $dateMax;
</script>
HTML;

// chargement de l'interface
require RACINE . "/include/interface.php";
