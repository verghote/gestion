"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {appelAjax, modifierColonne, supprimerEnregistrement} from "/composant/fonction/ajax.js";
import {
    confirmer,
    afficherSousLeChamp,
    afficherToast,
    retournerVersApresConfirmation
} from '/composant/fonction/afficher.js';
import {configurerFormulaire, configurerDate, effacerLesErreurs, filtrerLaSaisie} from "/composant/fonction/controle.js";
import {enleverAccent} from '/composant/fonction/format.js';
import { initialiserEtapes } from '/composant/fonction/etape.js';
import {initAutoComplete} from "/composant/fonction/autocomplete.js";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------
/* global dateMin, dateMax, lesClubs */

// récupération des éléments de l'interface
const nom = document.getElementById('nom');
const prenom = document.getElementById('prenom');
const sexe = document.getElementById('sexe');
const dateNaissance = document.getElementById('dateNaissance');
const idClub = document.getElementById('idClub');
const ffa = document.getElementById('ffa');
const email = document.getElementById('email');
const telephone = document.getElementById('telephone');
const licence = document.getElementById('licence');
const formulaire = document.getElementById('formulaire');

const nomR = document.getElementById('nomR');

const btnSupprimer = document.getElementById('btnSupprimer');

// -----------------------------------------------------------------------------------
// Procédures évènementielles
// -----------------------------------------------------------------------------------

nomR.onfocus = () => {
    nomR.value = '';
};

nom.onchange = function ()  {
    this.value = enleverAccent(this.value).toUpperCase();
    // on affiche le message de contrôle renvoyé par la propriété validationMessage ('' si les règles de validation sont respectées)
    afficherSousLeChamp(this.id);
    if (this.checkValidity()) {
        // fonction de rappel en cas de succès
        const success = () => {
            const nomPrenom = this.value + ' ' + prenom.value;
            // on réalise la modification dans le tableau lesCoureurs
            const index = lesCoureurs.findIndex(c => c.licence === licence.value);
            if (index !== -1) {
                lesCoureurs[index].nomPrenom = nomPrenom;
            }
        };
        // demande de modification du nom du coureur
        modifierColonne('coureur', this.id, this.value, licence.value, success);
    }
};

prenom.onchange = function () {
    this.value = enleverAccent(this.value).toUpperCase();
    afficherSousLeChamp(this.id);
    if (this.checkValidity()) {
        // fonction de rappel en cas de succès
        const success = () => {
            const nomPrenom = nom.value + ' ' + this.value;
            // on réalise la modification dans le tableau lesCoureurs
            const index = lesCoureurs.findIndex(c => c.licence === licence.value);
            if (index !== -1) {
                lesCoureurs[index].nomPrenom = nomPrenom;
            }

        };
        modifierColonne('coureur', this.id, this.value, licence.value, success);
    }
};

sexe.onchange = function () {
    modifierColonne('coureur', this.id, this.value, licence.value);
};

dateNaissance.onchange = function () {
    afficherSousLeChamp(this.id);
    if (this.checkValidity()) {
        modifierColonne('coureur', 'dateNaissance', dateNaissance.value, licence.value);
    }
};

licence.onchange = function () {
    // on affiche le message de contrôle renvoyé par la propriété validationMessage ('' si les règles de validation sont respectées)
    afficherSousLeChamp(this.id);
    if (this.checkValidity()) {
        modifierColonne('coureur', 'licence', this.value, licence.value);
    }
};

idClub.onchange = function () {
    modifierColonne('coureur', this.id, this.value, licence.value);
};

ffa.onchange = () => {
    const valeur = ffa.checked ? 1 : 0;
    modifierColonne('coureur', 'ffa', valeur, licence.value);
};

email.onchange = function() {
    if (this.value !== '') {
        // on affiche le message de contrôle renvoyé par la propriété validationMessage ('' si les règles de validation sont respectées)
        afficherSousLeChamp(this.id);
        if (this.checkValidity()) {
            modifierColonne('coureur', 'email', email.value, licence.value);
        }
    } else {
        effacerColonne(this.id);
    }
};

telephone.onchange = function() {
    if (this.value !== '') {
        afficherSousLeChamp(this.id);
        if (this.checkValidity()) {
            modifierColonne('coureur', this.id, this.value, licence.value);
        }
    } else {
        effacerColonne(this.id);
    }
};

// le bouton 'btnSupprimer'
btnSupprimer.onclick = () => confirmer(supprimer);


// -----------------------------------------------------------------------------------
// Fonctions de traitement
// -----------------------------------------------------------------------------------


function effacerColonne(colonne) {
    appelAjax({
        url: 'ajax/clearcolonne.php',
        data: {
            colonne: colonne,
            licence: licence.value
        },
        success:() => {
                afficherToast("Modification enregistrée");
        }
    });
}


/**
 * Demande de suppression du coureur actuellement affiché
 */
function supprimer() {
    const success = () => {
       retournerVersApresConfirmation('Coureur supprimé', '/consultation/coureur');
    };
    supprimerEnregistrement('coureur', licence.value, success);
}


/**
 * affichage des coordonnées du coureur contenues dans le paramètre implicite data
 * On conserve les coordonnées du coureur dans l'objet coureur afin de détecter une modification
 * @param data
 */
function afficher(data) {
    licence.value = data.licence;
    nom.value = data.nom;
    prenom.value = data.prenom;
    sexe.value = data.sexe;
    dateNaissance.value = data.dateNaissance;
    idClub.value = data.idClub;
    ffa.checked = data.ffa === 1;
    // pour les champs optionnels la valeur null est transformée en chaine vide ''
    email.value = data.email;
    telephone.value = data.telephone;
}


// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------



// intervalle sur la date de naissance
// La date doit être comprise entre dateMin et dateMax
configurerDate(dateNaissance, {
    min: dateMin,
    max: dateMax,
    valeur: dateMax
});

initialiserEtapes();

// alimentation de la zone de liste des clubs
for (const club of lesClubs) {
    idClub.add(new Option(club.nom, club.id));
}

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

// contrôle des données saisies toujours après le système d'autocomplétion qui vient ajouter ses propres balises
configurerFormulaire();
filtrerLaSaisie('telephone', /[0-9]/);
filtrerLaSaisie('nom', /[A-Za-z ]/);
filtrerLaSaisie('nomR', /[A-Za-z ]/);
filtrerLaSaisie('prenom', /[A-Za-z ]/);