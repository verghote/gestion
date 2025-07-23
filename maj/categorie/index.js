"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {modifierEnregistrement, supprimerEnregistrement} from "/composant/fonction/ajax.js";
import {confirmer,  retournerVersApresConfirmation, afficherSousLeChamp} from '/composant/fonction/afficher.js';
import {
    configurerFormulaire,
    donneesValides,
    effacerLesErreurs,
    filtrerLaSaisie
} from "/composant/fonction/controle.js";
import {ucFirst} from "/composant/fonction/format.js";
import {comparerSansAccentEtSansCasse} from "/composant/fonction/util";
import { initialiserEtapes } from '/composant/fonction/etape.js';


// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

/* global lesCategories */

// objet global contenant les informations sur la catégorie sélectionnée
let categorie = {};

const idR = document.getElementById('idR');
const nom = document.getElementById('nom');
const ageMin = document.getElementById('ageMin');
const ageMax = document.getElementById('ageMax');
const nb = document.getElementById('nb');
const msg = document.getElementById('msg');
const btnModifier = document.getElementById('btnModifier');
const btnSupprimer = document.getElementById('btnSupprimer');

// -----------------------------------------------------------------------------------
// Procédures évènementielles
// -----------------------------------------------------------------------------------

// sur le changement de catégorie, il faut récupérer les informations de la catégorie
idR.onchange = charger;

// demande de modification d'une catégorie
btnModifier.onclick = () => {

    // effacer les anciens messages d'erreur
    effacerLesErreurs();

    nom.value = ucFirst(nom.value.trim());
    if (donneesValides()) {
        let valide = true;
        // const min = parseInt(ageMin.value);
        // const max = parseInt(ageMax.value);
        const min = ageMin.valueAsNumber;
        const max = ageMax.valueAsNumber;
        // vérification de l'unicité du nom
        if (!estUnique(nom.value)) {
            afficherSousLeChamp('nom', "Le nom de la catégorie doit être unique");
            valide = false;
        }
        // vérification de l'intervale d'âge
        if (min >= max) {
            afficherSousLeChamp('ageMin', "L'âge minimum doit être inférieur à l'âge maximum");
            valide = false;
        } else {
            // vérification de la plage d'âge
            const id = idR.value;
            if (!plageValide(id, min, max)) {
                afficherSousLeChamp('ageMin', "La plage d'âge doit être cohérente avec les autres catégories");
                valide = false;
            }
        }
        if (valide) {
            modifier();
        }
    }
};

// demande de suppression  de la catégorie
btnSupprimer.onclick = () => confirmer(supprimer);


/**
 * Charge les informations de la catégorie sélectionnée
 */
function charger() {
    categorie = lesCategories.find(cat => cat.id === idR.value);
    afficher(categorie);
}


/**
 * Affiche les informations de la catégorie dans les champs du formulaire
 * @param {object} categorie
 */
function afficher(categorie) {
    nom.value = categorie.nom;
    ageMin.value = categorie.ageMin;
    ageMax.value = categorie.ageMax;
    nb.innerText = categorie.nb + " licencié(s) dans cette catégorie";
    // activation / désactivation du bouton
    btnSupprimer.style.display = categorie.nb === 0 ? 'block' : 'none';

    // alimentation des balises span de class 'nom' avec le nom de la catégorie
    for(const span of document.querySelectorAll('.nom')) {
        span.textContent = categorie.nom;
    }

    // vider l'éventuel message d'erreur
    msg.innerText = '';
}

/**
 * Vérifie si le nom de la catégorie est unique
 * Par sécurité, nous utilisons une comparaison insensible aux accents et à la casse
 * @param {string} nom
 * @returns {boolean}
 */
function estUnique(nom) {
    return lesCategories.findIndex(x => comparerSansAccentEtSansCasse(x.nom, nom) && x.id !== categorie.id) === -1;
}

/**
 * Vérifie si la plage d'âge est valide et ne chevauche pas les autres catégories
 * Il n'y a pas chevauchement si max est avant ageMin ou min est après ageMax (il suffit d'inverser la condition pour trouver un chevauchement)
 *  @param {number} id id de la catégorie actuellement affichée
 * @param {number} min
 * @param {number} max
 * @returns {boolean}
 */
function plageValide(id, min, max) {
    return !lesCategories.some(x => x.id !== id && !(max < x.ageMin || min > x.ageMax));
}

/**
 * Demande de suppression de la catégorie actuellement affichée
 */
function supprimer() {
    const success = () => {
        // on supprime la catégorie dans le tableau (facultatif)
        const index = lesCategories.findIndex(x => x.id === categorie.id);
        if (index !== -1) {
            lesCategories.splice(index, 1);
        }
        // mise à jour de la zone de liste idR
        idR.remove(idR.selectedIndex);
        // charger les données de la catégorie suivante
        charger();
    };
    supprimerEnregistrement('categorie', categorie.id, success);
}

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

configurerFormulaire();
// filtrerLaSaisie('nom', /[A-Za-z0-9 ]/);
filtrerLaSaisie('ageMin', /[0-9]/);
filtrerLaSaisie('ageMax', /[0-9]/);


// Tranformation en valeur numérique pour ageMin et AgeMax et alimentation de la zone de liste des catégories
// cela évitera les erreurs de comparaison
for (const element of lesCategories) {
    element.ageMin = parseInt(element.ageMin);
    element.ageMax = parseInt(element.ageMax);
    idR.add(new Option(element.nom + ' (' + element.id + ')', element.id));
}

// charger les informations de la catégorie actuellement sélectionnée
charger();

initialiserEtapes();
