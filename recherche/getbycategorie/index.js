"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {appelAjax} from "/composant/fonction/ajax.js";
import {ucWord} from "/composant/fonction/format.js";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

/* global lesCategories */

const idCategorie = document.getElementById('idCategorie');
const lesLignes = document.getElementById('lesLignes');
const nb = document.getElementById('nb');

// -----------------------------------------------------------------------------------
// Procédures évènementielles
// -----------------------------------------------------------------------------------

// gestionnaire d'évènement
idCategorie.onchange = () => {
        getLesCoureurs(idCategorie.value);
};

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

function getLesCoureurs(idCategorie) {
    appelAjax({
        url: 'ajax/getlescoureurs.php',
        data: {idCategorie: idCategorie},
        success: afficher
    });
}

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

// alimentation de la zone de liste des catégories
for (const element of lesCategories) {
    idCategorie.add(new Option(element.nom, element.id));
}

// sélection de la première catégorie
getLesCoureurs(idCategorie.value);
