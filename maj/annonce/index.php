<?php
// alimentation de l'interface
$titre = "Gestion des Annonces";

// récupération des annonces
$lesAnnonces = json_encode(Annonce::getAll());
$head = <<<HTML
<script>
    const lesAnnonces = $lesAnnonces;
</script>
HTML;

// chargement de l'interface
require RACINE . "/include/interface.php";
