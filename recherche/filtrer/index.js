"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {ucWord} from "/composant/fonction/format.js";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

/* global lesCoureurs  */
const search = document.getElementById('search');
const nb = document.getElementById('nb');
const lesLignes = document.getElementById('lesLignes');


// -----------------------------------------------------------------------------------
// Procédures évènementielles
// -----------------------------------------------------------------------------------

search.onfocus = () => {
    search.value = '';
};

// sur chaque caractère saisi dans le champ de recherche
search.oninput = afficher;


// -----------------------------------------------------------------------------------
// Fonctions de traitement
// -----------------------------------------------------------------------------------

function afficher() {
    lesLignes.innerHTML = '';
    let compteur = 0;

    for (const coureur of lesCoureurs) {
        if (!filtrer(coureur)) {
            continue;
        }
        compteur++;

        const tr = lesLignes.insertRow();
        tr.style.verticalAlign = 'middle';
        tr.id = coureur.id;

        // Colonne : licence
        let td = tr.insertCell();
        td.innerText = coureur.licence;
        td.style.textAlign = 'center';

        // Colonne Nom
        td = tr.insertCell();
        td.innerText = ucWord(coureur.nomPrenom);
        td.style.textAlign = 'left';

        // Colonne : Sexe
        td = tr.insertCell();
        td.innerText = coureur.sexe;
        td.style.textAlign = 'center';
        td.classList.add("masquer");

        // Colonne : Date de naissance
        td = tr.insertCell();
        td.innerText = coureur.dateNaissanceFr;
        td.style.textAlign = 'center';
        td.classList.add("masquer");

        // Colonne : Catégorie
        td = tr.insertCell();
        td.innerText = coureur.idCategorie;
        td.style.textAlign = 'center';

        // Colonne : Club
        td = tr.insertCell();
        td.innerText = coureur.nomClub;
        td.style.textAlign = 'left';
    }

    nb.innerText = compteur;
}


/**
 * Filtre les coureurs en fonction des critères sélectionnés.
 * @param coureur
 * @returns {boolean}
 */
function filtrer(coureur) {
    if (search.value === '') {
        return true; // Si le champ de recherche est vide, on affiche tous les coureurs
    }
    return coureur.nomPrenom.toLowerCase().includes(search.value.toLowerCase()) ||
           coureur.licence.includes(search.value) ||
           coureur.dateNaissanceFr.includes(search.value) ||
           coureur.nomClub.toLowerCase().includes(search.value.toLowerCase());
}


// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

afficher();



