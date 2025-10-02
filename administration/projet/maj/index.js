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

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

/* global lesProjets */

let lesLignes = document.getElementById('lesLignes');

// -----------------------------------------------------------------------------------
// Procédures évènementielles
// -----------------------------------------------------------------------------------

// -----------------------------------------------------------------------------------
// Fonctions de traitement
// -----------------------------------------------------------------------------------

// Fonction principale d’affichage de la liste des projets
function afficherLesProjets() {
        lesLignes.innerHTML = '';
        for (const projet of lesProjets) {
            const ligne = creerLigneProjet(projet);
            lesLignes.appendChild(ligne);
        }
}

/**
 * Crée et retourne une ligne <tr> représentant un projet.
 * @param {object} projet - Objet projet avec au minimum id et nom
 * @returns {HTMLTableRowElement} - Ligne de tableau prête à être insérée
 */
function creerLigneProjet(projet) {
    const { id, nom } = projet;

    // Création de la ligne
    const tr = document.createElement('tr');
    tr.id = id;
    tr.style.verticalAlign = 'middle';

    // 1. Colonne actions
    const tdAction = document.createElement('td');

    // Bouton de modification
    const actionModifier = () => location.href = '/administration/projet/majprojet/?id=' + id;
    const btnModifier = creerBoutonModification(actionModifier);
    tdAction.appendChild(btnModifier);

    // Bouton de suppression
    const supprimer = () =>
        appelAjax({
            url: '/ajax/supprimer.php',
            data: {
                table: 'projet',
                id: id
            },
            success: () => tr.remove()
        });
    const actionSupprimer = () => confirmer(supprimer);
    const btnSupprimer = creerBoutonSuppression(actionSupprimer);
    tdAction.appendChild(btnSupprimer);

    tr.appendChild(tdAction);

    // 2. Colonne modifiable
    const tdNom = document.createElement('td');
    const inputNom = creerInputTexte();
    inputNom.style.width = '600px';
    inputNom.value = nom;
    inputNom.addEventListener('change', function () {
        if (verifier(this)) {
            appelAjax({
                url: '/ajax/modifiercolonne.php',
                data: {
                    table: 'projet',
                    colonne: 'nom',
                    valeur: this.value,
                    id: id,
                },
                success: reponse => afficherToast(reponse.success)
            });
        }
    });
    tdNom.appendChild(inputNom);
    tr.appendChild(tdNom);

    return tr;
}

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

// Affichage des projets dans le tableau

afficherLesProjets();

