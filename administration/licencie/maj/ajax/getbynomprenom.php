<?php

$lesEtudiants = [];

// vérification de la transmission des données attendues
if (!Std::existe('search')) {
    echo json_encode([]);
    exit;
}

$search = $_GET['search'];

// Vérification du format de l'identifiant
if (!preg_match('/^[0-9a-zA-Z]+$/', $search)) {
    echo json_encode([]);
    exit;
}


// Récupération des étudiants
echo json_encode(Coureur::getByNomPrenom($search), JSON_UNESCAPED_UNICODE);
