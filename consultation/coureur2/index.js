"use strict";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------
/* global lesCoureurs, Tabulator  */

// Propriété de l'objet lesCoureurs : licence, nom, prenom, sexe, dateNaissanceFr, idCategorie, nomClub
// Colonne du tableau : Licence, Nom, Prénom, Sexe, Date de naissance, Catégorie, Club

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

const btnCsv = document.getElementById("btnCsv");
const btnJson = document.getElementById("btnJson");

// -----------------------------------------------------------------------------------
// procédures évènementielles
// -----------------------------------------------------------------------------------

btnCsv.onclick = () => table.download("csv", "lesCoureurs.csv");
btnJson.onclick = () => table.download("json", "lesCoureurs.json");

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

// Initialisation du composant Tabulator
let options = {
    data: lesCoureurs,
    layout: "fitColumns",
    responsiveLayout: "hide", // Active la gestion des colonnes en mode responsive
    columns: [
        {
            title: 'Licence',
            field: 'licence',
            hozAlign: "center",
            headerHozAlign: "center",
            headerFilter: "input",
            minWidth: 100,
            responsive: 1
        },
        {
            title: 'Nom',
            field: 'nom',
            headerFilter: "input",
            minWidth: 150,
        },
        {
            title: 'Prénom',
            field: 'prenom',
            headerFilter: "input",
            minWidth: 150,
        },
        {
            title: 'Sexe',
            field: 'sexe',
            hozAlign: "center",
            headerHozAlign: "center",
            headerFilter: "input",
            minWidth: 50,
            responsive: 4 // Priorité de masquage (2 = masqué après les colonnes ayant priorité 1)
        },
        {
            title: 'Né(e) le',
            field: 'dateNaissanceFr',
            hozAlign: "center",
            headerHozAlign: "center",
            headerFilter: "input",
            minWidth: 100,
            responsive: 3 // Priorité de masquage
        },
        {
            title: 'Cat.',
            field: 'idCategorie',
            hozAlign: "center",
            headerHozAlign: "center",
            headerFilter: "input",
            minWidth: 70,
            responsive: 2
        },
        {
            title: 'Club',
            field: 'nomClub',
            headerFilter: "input",
            minWidth: 150,
            responsive: 2 // Priorité de masquage
        }
    ],
    tooltips: true,
    pagination: 'local',
    paginationSize: 20,
    paginationSizeSelector: [20, 50, 100],
    movableColumns: true,
    initialSort: [
        {column: 'licence', dir: 'asc'}
    ],
    rowFormatter: function (row) {
        row.getElement().style.backgroundColor = "#FFF";
    },
};
let table = new Tabulator('#tableau', options);

