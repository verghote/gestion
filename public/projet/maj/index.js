
"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {appelAjax} from "/composant/fonction/ajax.js";
import {confirmer, afficherToast} from '/composant/fonction/afficher.js';
import {getData} from "/composant/fonction/page.js";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

const lesProjets = getData("lesProjets");

const lesLignes = document.getElementById('lesLignes');
const modeleLigne = document.getElementById('modeleLigne');

// -----------------------------------------------------------------------------------
// Fonctions de traitement
// -----------------------------------------------------------------------------------

/**
 * Demande de suppression d'un projet
 * @param {number|string} id
 */
function supprimer(id) {
    appelAjax({
        url: 'ajax/supprimer.php',
        data: {id},
        success: () => document.getElementById(id)?.remove(),
        error: () => afficherToast(
            "Erreur lors de la suppression",
            "error"
        )
    });
}

/**
 * Demande de modification du nom du projet
 * @param {HTMLInputElement} inputNom
 * @param {number|string} id
 */
function modifierNom(inputNom, id) {
    appelAjax({
        url: 'ajax/modifiernomprojet.php',
        data: {
            primarykey: id,
            columns: {nom: inputNom.value}
        },
        success: (data) => {
            afficherToast(data.message);
            inputNom.classList.remove("text-danger");
            inputNom.classList.add("text-success");
        }
    });
}

/**
 * Crée une ligne de tableau représentant un projet
 * @param {Object} projet
 * @returns {HTMLTableRowElement}
 */
function creerLigneProjet(projet) {

    // Cloner le modèle HTML
    const tr = modeleLigne.content.firstElementChild.cloneNode(true);

    // Identifier la ligne
    tr.id = projet.id;

    // Récupérer les éléments du template
    const btnModifier = tr.querySelector('.btn-modifier');
    const btnSupprimer = tr.querySelector('.btn-supprimer');
    const inputNom = tr.querySelector('.input-nom');

    // Initialiser le champ du nom
    inputNom.value = projet.nom;

    // Action : modifier le projet
    btnModifier.addEventListener('click', () => {
        location.href = `/projet/majcompetenceprojet/?id=${projet.id}`;
    });

    // Action : supprimer le projet
    btnSupprimer.addEventListener('click', () => {
        confirmer(() => supprimer(projet.id));
    });

    // Action : enregistrer le nouveau nom
    inputNom.addEventListener('change', function () {

        if (!this.checkValidity()) {
            this.classList.remove('text-success');
            this.classList.add('text-danger');
            this.reportValidity();
            return;
        }

        modifierNom(this, projet.id);
    });

    return tr;
}

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

lesLignes.replaceChildren();

for (const projet of lesProjets) {
    lesLignes.appendChild(creerLigneProjet(projet));
}
