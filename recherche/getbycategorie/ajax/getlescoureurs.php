<?php
// contrôle de la transmission du paramètre idCategorie
if (!isset($_POST['idCategorie'])) {
    Erreur::envoyerReponse("L'identifiant de la catégorie n'est pas transmis", 'global');
}

// récupération du paramètre
$idCategorie = $_POST['idCategorie'];

// vérification du format du paramètre
if (!preg_match("/^[A-Z](?:[A-Z]|\d|10)$/", $idCategorie)) {
    Erreur::envoyerReponse("L'identifiant de la catégorie n'est pas conforme", 'global');
}

// récupération et envoi des licenciés dans cette catégorie
echo json_encode(Coureur::getByCategorie($idCategorie));





