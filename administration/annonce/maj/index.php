<?php

// Contrôle de la transmission du paramètre attendu : id
if (!isset($_GET['id']) ) {
    Erreur::afficherReponse("Le numéro de l'annonce n'est pas transmis", 'global');
}

// Contrôle du format de l'identifiant : un entier
$id = filter_var($_GET['id'], FILTER_VALIDATE_INT);
if ($id === false) {
    Erreur::afficherReponse("La valeur transmise n'est pas du type attendu", 'system');
}

// Contrôle de la validité de l'identifiant : doit être présent dans la table annonce
$ligne = Annonce::getById($id);
if (!$ligne) {
    Erreur::afficherReponse("Cette annonce n'existe pas", 'global');
}

// alimentation de l'interface
// l'annonce à modifier
$annonce = json_encode($ligne);

// chargement des ressources spécifiques de l'interface :tinyMce, dateFr pour le calendrier
$head = <<<HTML
    <script src='/composant/tinymce/tinymce.min.js' referrerpolicy='origin'></script>
    <script>
        const annonce = $annonce;
    </script>
HTML;

// chargement de la page
require RACINE . '/include/interface.php';

