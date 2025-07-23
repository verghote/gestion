"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {appelAjax, } from "/composant/fonction/ajax.js";
import {retournerVers} from '/composant/fonction/afficher.js';
import {donneesValides} from "/composant/fonction/controle";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

const btnAjouter = document.getElementById('btnAjouter');
const msg = document.getElementById('msg');
const nom = document.getElementById('nom');


// -----------------------------------------------------------------------------------
// Procédures évènementielles
// -----------------------------------------------------------------------------------

btnAjouter.onclick = () => {
    msg.innerText = "";
    if (donneesValides() ) {
        ajouter();
    }
};


// -----------------------------------------------------------------------------------
// Fonctions de traitement
// -----------------------------------------------------------------------------------


/**
 * Ajoute un projet
 */
function ajouter() {
    // Vider la zone de message utilisateur
    msg.innerHTML = "";

    // appel ajax pour ajouter un administrateur
    appelAjax({
        url: '/ajax/ajouter.php',
        data: {
            table: 'projet',
            nom: nom.value,
        },
        success: () => {
            retournerVers("Projet ajouté avec succès", ".");
        },
    });
}


// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------


