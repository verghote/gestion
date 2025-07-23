<?php

// alimentation de l'interface
$titre = "Les coureurs - utilisation du composant table.js";

// Récupération des coureurs : licence, nom prenom, sexe, dateNaissanceFr au format fr, idCategorie, nomClub
$lesCoureurs = json_encode(Coureur::getAll());

$head = <<<EOD
<script>
    const lesCoureurs = $lesCoureurs;
</script>
EOD;

// chargement de l'interface
require RACINE . "/include/interface.php";
