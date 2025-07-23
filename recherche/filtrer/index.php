<?php
// alimentation de l'interface
$titre = "Recherche sur nom, prénom ou club";

// Récupération des coureurs : licence, nom prenom, sexe, dateNaissanceFr au format fr, idCategorie, nomClub
$lesCoureurs = json_encode(Coureur::getAll());
$head = <<<HTML
<script>
    const lesCoureurs = $lesCoureurs;
</script>
HTML;

// chargement de l'interface
require RACINE . "/include/interface.php";

