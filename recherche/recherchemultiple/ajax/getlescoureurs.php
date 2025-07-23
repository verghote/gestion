<?php
// contrôle de la transmission du paramètre idCategorie
if (!isset($_POST['idCategorie'])) {
    Erreur::envoyerReponse("L'identifiant de la catégorie n'est pas transmis", 'global');
}

// contrôle de la transmission du paramètre idClub
if (!isset($_POST['idClub'])) {
    Erreur::envoyerReponse("L'identifiant du club n'est pas transmis", 'global');
}

// contrôle de la transmission du paramètre sexe
if (!isset($_POST['sexe'])) {
    Erreur::envoyerReponse("Le sexe n'est pas transmis", 'global');
}

// récupération des trois paramètres
$idCategorie = $_POST['idCategorie'];
$idClub = $_POST['idClub'];
$sexe = strtoupper($_POST['sexe']);

// vérification du format du paramètre idCategorie : une lettre majuscule suivie d'une lettre majuscule ou d'un chiffre ou de 10 ou *
if (!preg_match("/^[A-Z](?:[A-Z]|\d|10)$/", $idCategorie) && $idCategorie != '*') {
    Erreur::envoyerReponse("L'identifiant de la catégorie n'est pas conforme", 'global');
}

// vérification du format du paramètre idClub : 6 chiffres exactement commençant par 080 ou *
if (!preg_match("/^080\d{3}$/", $idClub) && $idClub != '*') {
    Erreur::envoyerReponse("L'identifiant du club n'est pas conforme", 'global');
}

// vérification du format du paramètre sexe : M ou F ou *
if (!preg_match("/^[MF*]$/", $sexe)) {
    Erreur::envoyerReponse("Le sexe n'est pas conforme", 'global');
}

// récupération et envoi des licenciés dans cette catégorie
echo json_encode(Coureur::getBySexeClubCategorie($sexe, $idClub, $idCategorie));
