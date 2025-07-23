"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {ucWord} from "/composant/fonction/format.js";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

/* global lesCategories, lesClubs, lesCoureurs */
// lesCatégories : Tableau permettant de remplir la zone de liuste des catégories
// lesClubs : Tableau permettant de remplir la zone de liste des clubs

// récupération des éléments de l'interface
const idCategorie = document.getElementById('idCategorie');
const idClub = document.getElementById('idClub');
const sexe = document.getElementById('sexe');
const nb = document.getElementById('nb');
const lesLignes = document.getElementById('lesLignes');

// -----------------------------------------------------------------------------------
// Procédures évènementielles
// -----------------------------------------------------------------------------------

idCategorie.onchange = afficher;
idClub.onchange = afficher;
sexe.onchange = afficher;

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
    return (idCategorie.value === '*' || coureur.idCategorie === idCategorie.value) &&
        (idClub.value === '*' || coureur.idClub === idClub.value) &&
        (sexe.value === '*' || coureur.sexe === sexe.value);
}

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------
// alimentation de la zone de liste des catégories
for (const element of lesCategories) {
    idCategorie.appendChild(new Option(element.nom, element.id));
}

// alimentation de la zone de liste des clubs
for (const element of lesClubs) {
    idClub.add(new Option(element.nom, element.id));
}

afficher(); // Lancement de la recherche initiale
