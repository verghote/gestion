"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {creerTable} from '/composant/fonction/table.js';

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

/* global lesCoureurs  */
// récupération des données de l'interface
const reponse = document.getElementById('reponse');

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

const option = {
    data: lesCoureurs,
    id: 'leTableau',
    style: 'margin:auto',
    headers: {
        licence: 'Licence',
        nom: 'Nom',
        prenom: 'Prénom',
        sexe: 'Sexe',
        dateNaissanceFr: 'Né(e) le',
        idCategorie: 'Catégorie',
        nomClub: 'Club'
    },
    headStyle: {
        licence: 'text-align: center;',
        sexe: 'text-align: center;',
        idCategorie: 'text-align: center;',
        dateNaissanceFr: 'text-align: center;',
    },
    bodyStyle: {
        licence: 'text-align: center;',
        sexe: 'text-align: center;',
        idCategorie: 'text-align: center;',
        dateNaissanceFr: 'text-align: center;',
    },
    class: {
        licence: 'masquer',
        sexe: 'masquer',
        dateNaissanceFr: 'masquer',
        nomClub: 'masquer',
    }
};
reponse.appendChild(creerTable(option));
