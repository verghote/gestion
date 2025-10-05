"use strict";
// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {appelAjax} from "/composant/fonction/ajax.js";
import {retournerVersApresConfirmation } from "/composant/fonction/afficher.js";
import {configurerFormulaire, configurerDate, donneesValides, filtrerLaSaisie, enleverAccent,supprimerEspace} from "/composant/fonction/formulaire.js";
import {initialiserEtapes} from "/composant/fonction/etape.js";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

/* global lesClubs, dateMin, dateMax */

const licence = document.getElementById('licence');
const nom = document.getElementById('nom');
const prenom = document.getElementById('prenom');
const sexe = document.getElementById('sexe');
const dateNaissance = document.getElementById('dateNaissance');
const idClub = document.getElementById('idClub');
const ffa = document.getElementById('ffa');
const email = document.getElementById('email');
const telephone = document.getElementById('telephone');
const msg = document.getElementById('msg');
const btnAjouter = document.getElementById('btnAjouter');


// -----------------------------------------------------------------------------------
// Procédures évènementielles
// -----------------------------------------------------------------------------------

btnAjouter.onclick = () => {
    // mise en forme des données
    nom.value = enleverAccent(supprimerEspace(nom.value)).toUpperCase();
    prenom.value = enleverAccent(supprimerEspace(prenom.value)).toUpperCase();
    // contrôle des champs de saisie
    msg.innerHTML = "";
    if (donneesValides()) {
        ajouter();
    }
};

// -----------------------------------------------------------------------------------
// Fonctions de traitement
// -----------------------------------------------------------------------------------

function ajouter() {
    // Alimentation de l'objet formData pour le transfert des données
    const formData = new FormData();
    formData.append('table', 'coureur');
    formData.append('nom', nom.value);
    formData.append('prenom', prenom.value);
    formData.append('sexe', sexe.value);
    formData.append('dateNaissance', dateNaissance.value);
    formData.append('licence', licence.value);
    formData.append('idClub', idClub.value);
    formData.append('ffa', ffa.checked ? '1' : '0');

    // prise en compte des champs optionnels
    if (email.value.length > 0) {
        formData.append('email', email.value);
    }
    if (telephone.value.length > 0) {
        formData.append('telephone', telephone.value);
    }

    //  demande d'ajout dans la base de données
    appelAjax({
        url: '/ajax/ajouter.php',
        data: formData,
        success: (data) => {
                retournerVersApresConfirmation(data.success, '/administration/licencie/liste');
        }
    });
}

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

initialiserEtapes();

// alimentation de la zone de liste des clubs
for (const element of lesClubs) {
    idClub.add(new Option(element.nom, element.id));
}

// contrôle des données
configurerFormulaire();
filtrerLaSaisie('telephone', /[0-9]/);
filtrerLaSaisie('licence', /[0-9]/);
filtrerLaSaisie('nom', /[A-Za-z '-]/);
filtrerLaSaisie('prenom', /[A-Za-zÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜÝàáâãäåçèéêëìíîïðòóôõöùúûüýÿ '-]/);


// La date doit être comprise entre dateMin et dateMax
configurerDate(dateNaissance, {
    min:dateMin,
    max: dateMax,
    valeur: dateMax
});

// Données de test
nom.value = 'Dupont';
prenom.value = 'Hervé';
licence.value = '000000';
