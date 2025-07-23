<?php
// alimentation de l'interface
$titre = "Recherche sur des critères imbriqués";


$lesBlocs = json_encode(Competence::getLesBlocs());

$head = <<<HTML
<script>
    const lesBlocs = $lesBlocs;
</script>
HTML;

// chargement de l'interface
require RACINE . "/include/interface.php";
