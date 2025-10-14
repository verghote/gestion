<?php
// récupération de tous les projets
$lesProjets = json_encode(Projet::getAll());

$head = <<<HTML
<script>
    const lesProjets =  $lesProjets
</script>
HTML;

// chargement de l'interface
require RACINE . "/include/interface.php";

