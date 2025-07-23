<?php

// alimentation de l'interface
$titre = "Les coureurs - utilisation de tabulator";

// Récupération des coureurs : licence, nom prenom, sexe, dateNaissanceFr au format fr, idCategorie, nomClub
$lesCoureurs = json_encode(Coureur::getAll());
$head = <<<HTML
    <!-- Script Tabulator  -->
    <link href="/composant/tabulator/tabulator.min.css" rel="stylesheet">
    <script t src="/composant/tabulator/tabulator.min.js"></script>
    <style>
        /* Désactive les zébrures */
        .tabulator .tabulator-row:nth-child(even) {
            background-color: inherit !important;
        }
    </style>
    <script>
        const lesCoureurs = $lesCoureurs;
    </script>
HTML;

// chargement de l'interface
require RACINE . "/include/interface.php";
