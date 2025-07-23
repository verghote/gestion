"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {getAge} from '/composant/fonction/date.js';
import {initAutoComplete} from "/composant/fonction/autocomplete.js";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

const nomR = document.getElementById('nomR');
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

// Efface le champ de saisie quand celui-ci est sélectionné ainsi que les balises output
nomR.onfocus = function() {
    // Efface les valeurs des champs 'output'
    document.querySelectorAll('output').forEach(el => el.value = '');
    this.value = ''; // Efface le champ de saisie
};

// -----------------------------------------------------------------------------------
// Fonctions de traitement
// -----------------------------------------------------------------------------------

function afficher(coureur) {
    licence.innerText = coureur.licence;
    prenom.innerText = coureur.prenom;
    sexe.innerText = coureur.sexe;
    dateNaissance.innerText = coureur.dateNaissanceFr;
    nomClub.innerText = coureur.nomClub;
    idCategorie.innerText = coureur.idCategorie;
    age.innerText = getAge(coureur.dateNaissanceFr) + ' ans';
    nom.value = coureur.nom;
    nomR.blur(); // retire le focus du champ de saisie
}

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

// paramétrage du composant autoComplete
initAutoComplete({
    selector: "#nomR",
    fetchUrl: "ajax/getbynomprenom.php",
    searchKey: "nomPrenom",
    onSelection: (selection) => {
        nomR.value = selection.nomPrenom;
        afficher(selection);
    }
});