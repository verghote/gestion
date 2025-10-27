<?php
// récupérer les clubs pour alimenter la zone de liste des clubs
$lesClubs = json_encode(Club::getListe());

// récupération de l'intervalle des dates de naissance possible
$dateMin = json_encode(Categorie::getDateNaissanceMin());
$dateMax = json_encode(Categorie::getDateNaissanceMax());

$head = <<<HTML
    <script src="/composant/autocomplete/autocomplete.min.js"></script>
    <link rel="stylesheet" href="/composant/autocomplete/autocomplete.css">
    <script>
        const lesClubs = $lesClubs;
        const dateMin = $dateMin;
        const dateMax = $dateMax;
</script>
HTML;

// chargement de l'interface
require RACINE . "/include/interface.php";