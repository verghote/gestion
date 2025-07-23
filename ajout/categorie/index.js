"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {appelAjax} from "/composant/fonction/ajax.js";
import {afficherSousLeChamp, retournerVers} from "/composant/fonction/afficher.js";
import {filtrerLaSaisie, configurerFormulaire, donneesValides } from "/composant/fonction/controle.js";
import {ucFirst} from '/composant/fonction/format.js';
import {comparerSansAccentEtSansCasse} from "/composant/fonction/util";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

/* global lesCategories */

const id = document.getElementById('id');
const nom = document.getElementById('nom');
const ageMin = document.getElementById('ageMin');
const ageMax = document.getElementById('ageMax');
let msg = document.getElementById('msg');
const btnAjouter = document.getElementById('btnAjouter');

// Données de test
id.value = 'BE';
nom.value = 'Benjamin';
ageMin.value = 11;
ageMax.value = 13;

// demande d'ajout d'une catégorie

btnAjouter.onclick = () => {
    msg.innerHTML = '';
    id.value = id.value.trim().toUpperCase();
    nom.value = ucFirst(nom.value.trim());

    if (!donneesValides()) {
        return;
    }
    const erreurs = validerCategorie(id.value, nom.value, ageMin.valueAsNumber, ageMax.valueAsNumber);
    if (erreurs.length > 0) {
        for (const err of erreurs) {
            afficherSousLeChamp(err.champ, err.message);
        }
        return;
    }
    ajouter();
};

// -----------------------------------------------------------------------------------
// Fonctions de traitement
// -----------------------------------------------------------------------------------

/**
 * Valide les données d'une nouvelle catégorie.
 * Retourne un tableau d’erreurs sous forme de { champ, message }
 *
 * @param {string} id - Identifiant en majuscule
 * @param {string} nom - Nom affiché
 * @param {number} ageMin
 * @param {number} ageMax
 * @returns {{champ: string, message: string}[]} Tableau des erreurs
 */
function validerCategorie(id, nom, ageMin, ageMax) {
    const lesErreurs = [];
    if (!idUnique(id)) {
        lesErreurs.push({
            champ: 'id',
            message: "L'identifiant de la catégorie doit être unique"
        });
    }
    if (!nomUnique(nom)) {
        lesErreurs.push({
            champ: 'nom',
            message: "Le nom de la catégorie doit être unique"
        });
    }
    if (ageMin >= ageMax) {
        lesErreurs.push({
            champ: 'ageMin',
            message: "L'âge minimum doit être inférieur à l'âge maximum"
        });
    } else if (!plageValide(ageMin, ageMax)) {
        lesErreurs.push({
            champ: 'ageMin',
            message: "La plage d'âge doit être cohérente avec les autres catégories"
        });
    }
    return lesErreurs;
}

/**
 * Contrôle si l'identifiant de la catégorie est unique
 * Les identifiants sont forcément en majuscule la comparaison avec === est donc suffisante
 * @param {string} id
 * @returns {boolean}
 */
function idUnique(id) {
    return lesCategories.findIndex(x => x.id === id) === -1;
}

/**
 * Contrôle si le nom de la catégorie est unique
 * Par sécurité, nous utilisons une comparaison insensible aux accents et à la casse
 * @param {string} nom
 * @returns {boolean}
 */
function nomUnique(nom) {
    // return lesCategories.findIndex(x => x.nom === nom) === -1;
    // return lesCategories.findIndex(x => x.nom.toLowerCase() === nom.toLowerCase()) === -1;
    return lesCategories.findIndex(x => comparerSansAccentEtSansCasse(x.nom, nom)) === -1;
}

/**
 * Vérifie si la plage d'âge est valide et ne chevauche pas les autres catégories
 * Il n'y a pas chevauchement si max est avant ageMin ou min est après ageMax (il suffit d'inverser la condition pour trouver un chevauchement)
 * @param {number} min
 * @param {number} max
 * @returns {boolean}
 */
function plageValide(min, max) {
    return !lesCategories.find(x => max >= x.ageMin && min <= x.ageMax);
}

function ajouter() {
    appelAjax({
        url: '/ajax/ajouter.php',
        data: {
            table : 'categorie',
            id: id.value,
            nom: nom.value,
            ageMin : ageMin.valueAsNumber,
            ageMax : ageMax.valueAsNumber
        },
        success: () => {
                retournerVers("Catégorie enregistrée", "/consultation/categorie");
        }
    });
}

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------
configurerFormulaire();
filtrerLaSaisie('nom', /[A-Za-z0-9 ]/);
filtrerLaSaisie('id', /[A-Za-z0-9]/);
// un champ de type number accepte le 'e'
filtrerLaSaisie('ageMin', /[0-9]/);
filtrerLaSaisie('ageMax', /[0-9]/);

