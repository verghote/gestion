"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {appelAjax} from "/composant/fonction/ajax.js";
import {filtrerLaSaisie, } from "/composant/fonction/controle.js";
import {getAge} from '/composant/fonction/date.js';
import {afficherSousLeChamp} from "../../composant/fonction/afficher";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

// récupération des éléments de l'interface

const licence = document.getElementById('licence');
const nom = document.getElementById('nom');
const prenom = document.getElementById('prenom');
const sexe = document.getElementById('sexe');
const dateNaissance = document.getElementById('dateNaissance');
const nomClub = document.getElementById('nomClub');
const idCategorie = document.getElementById('idCategorie');
const age = document.getElementById('age');

// -----------------------------------------------------------------------------------
// Procédures évènementielles
// -----------------------------------------------------------------------------------

licence.onchange = function()  {
    if (this.checkValidity()) {
        rechercher(this.value);
    } else {
        afficherSousLeChamp('licence');
    }
};

// Efface le champ de saisie quand celui-ci est sélectionné
licence.onfocus = function () {
    nom.innerText = '';
    prenom.innerText = '';
    sexe.innerText = '';
    dateNaissance.innerText = '';
    nomClub.innerText = '';
    idCategorie.innerText = '';
    age.innerText = '';
    // Réinitialisation du champ de saisie
    this.value = '';
};

/*
 Autre possibilité pour effacer les valeurs des champs 'output'
    const outputs = document.querySelectorAll('output');
    for (const el of outputs) {
        // On ne vide que les balises output dont l'id est différent de 'licence'
        if (el.id !== 'licence') {
            el.innerHTML = '';
        }
    }
 */

// Lancement de la recherche
function rechercher(licence) {
    appelAjax({
        url: 'ajax/getbylicence.php',
         data: {
            licence: licence,
        },
        success: (data) => afficher(data)
    });
}

function afficher(coureur) {
    nom.innerText = coureur.nom;
    prenom.innerText = coureur.prenom;
    sexe.innerText = coureur.sexe;
    dateNaissance.innerText = coureur.dateNaissanceFr;
    nomClub.innerText = coureur.nomClub;
    idCategorie.innerText = coureur.idCategorie;
    age.innerText = getAge(coureur.dateNaissanceFr) + ' ans';
    licence.blur(); // retire le focus du champ de saisie
}

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

// filtrage de la saisie
filtrerLaSaisie('licence', /[0-9]/);

