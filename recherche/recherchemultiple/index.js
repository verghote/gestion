"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {appelAjax} from "/composant/fonction/ajax.js";
import {ucWord} from "/composant/fonction/format.js";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

/* global lesCategories, lesClubs */
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

idCategorie.onchange = filtrer;
idClub.onchange = filtrer;
sexe.onchange = filtrer;

// -----------------------------------------------------------------------------------
// Fonctions de traitement
// -----------------------------------------------------------------------------------

function afficher(lesCoureurs) {
    lesLignes.innerHTML = '';
    nb.innerText = lesCoureurs.length;

    for (const coureur of lesCoureurs) {
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
}


function filtrer() {
    appelAjax({
        url: 'ajax/getlescoureurs.php',
        data: {
            idCategorie: idCategorie.value,
            idClub: idClub.value,
            sexe: sexe.value
        },
        success: afficher
    });
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

filtrer(); // Lancement de la recherche initiale