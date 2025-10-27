"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {appelAjax} from "/composant/fonction/ajax.js";
import {confirmer, afficherToast} from '/composant/fonction/afficher.js';
import {
    verifier,
    creerBoutonModification,
    creerBoutonSuppression,
    creerInputTexte
} from '/composant/fonction/formulaire.js';
import {getTd, getTr} from "/composant/fonction/trtd.js";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

/* global lesProjets */

const lesLignes = document.getElementById('lesLignes');

// -----------------------------------------------------------------------------------
// Fonctions de traitement
// -----------------------------------------------------------------------------------

/**
 * Demande de suppression d'un projet
 * @param {number} id
 */
function supprimer(id) {
    appelAjax({
        url: '/ajax/supprimer.php',
        data: {
            table: 'projet',
            id: id
        },
        success: () => document.getElementById(id)?.remove(),
        error: () => afficherToast("Erreur lors de la suppression", "error")
    });
}

/**
 * Demande de modification du nom du projet
 * @param {HTMLInputElement} inputNom
 * @param {number} id
 */
function modifierNom(inputNom, id) {
    appelAjax({
        url: '/ajax/modifiercolonne.php',
        data: {
            table: 'projet',
            colonne: 'nom',
            valeur: inputNom.value,
            id: id
        },
        success: () => inputNom.style.color = 'green'
    });
}

/**
 * Crée la colonne des actions : bouton modifier et supprimer
 * @param {number} id
 * @returns {HTMLTableCellElement}
 */
function creerColonneAction(id) {
    const actionModifier = () => location.href = '/administration/projet/majprojet/?id=' + id;
    const actionSupprimer = () => confirmer(() => supprimer(id));

    const btnModifier = creerBoutonModification(actionModifier);
    const btnSupprimer = creerBoutonSuppression(actionSupprimer);

    btnModifier.setAttribute('aria-label', 'Modifier le projet');
    btnSupprimer.setAttribute('aria-label', 'Supprimer le projet');

    const tdAction = getTd('');
    tdAction.appendChild(btnModifier);
    tdAction.appendChild(btnSupprimer);

    return tdAction;
}

/**
 * Crée la colonne du nom
 * @param {number} id
 * @param {string} nom
 * @returns {HTMLTableCellElement}
 */
function creerColonneNom(id, nom) {
    const inputNom = document.createElement('input');
    inputNom.type = 'text';
    inputNom.style.width = '600px';
    inputNom.value = nom;
    inputNom.setAttribute('aria-label', 'Nom du projet');

    inputNom.onchange = function () {
        if (this.checkValidity()) {
            modifierNom(this, id);
        } else {
            this.style.color = 'red';
            this.reportValidity();
        }
    };

    const tdNom = getTd('');
    tdNom.appendChild(inputNom);

    return tdNom;
}

/**
 * Crée une ligne de tableau représentant un projet
 * @param {Object} projet - Objet projet avec id et nom
 * @returns {HTMLTableRowElement}
 */
function creerLigneProjet(projet) {
    const {id, nom} = projet;

    const tr = getTr([]);
    tr.id = id;
    tr.style.verticalAlign = 'middle';

    // Création et ajout des colonnes
    tr.appendChild(creerColonneAction(id));
    tr.appendChild(creerColonneNom(id, nom));

    return tr;
}

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

for (const projet of lesProjets) {
    lesLignes.appendChild(creerLigneProjet(projet));
}