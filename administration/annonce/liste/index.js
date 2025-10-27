"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {appelAjax} from '/composant/fonction/ajax.js';
import {confirmer, genererMessage} from '/composant/fonction/afficher.js';
import {creerBoutonModification, creerBoutonSuppression, creerCheckbox} from '/composant/fonction/formulaire.js';
import {getTd, getTr} from "/composant/fonction/trtd.js";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

/* global lesAnnonces */

const lesLignes = document.getElementById('lesLignes');
const msg = document.getElementById('msg');
const deleteOld = document.getElementById('deleteOld');

// -----------------------------------------------------------------------------------
// Procédures évènementielles
// -----------------------------------------------------------------------------------

deleteOld.onclick = () => confirmer(supprimerAnciennesAnnonces);

// -----------------------------------------------------------------------------------
// Fonctions de traitement
// -----------------------------------------------------------------------------------

/**
 * Demande de suppression d'une annonce
 * @param {number} id
 */
function supprimer(id) {
    appelAjax({
        url: '/ajax/supprimer.php',
        data: {table: 'annonce', id: id},
        success: () => document.getElementById(id)?.remove(),
    });
}

/**
 * Demande de modification de la colonne actif
 * @param {HTMLInputElement} checkbox
 * @param {number} id
 */
function modifierActif(checkbox, id) {
    const valeur = checkbox.checked ? 1 : 0;
    appelAjax({
        url: '/ajax/modifiercolonne.php',
        data: {
            table: 'annonce',
            colonne: 'actif',
            valeur: valeur,
            id: id
        },
        error: () => {
            // Annuler le changement en cas d'erreur
            checkbox.checked = !checkbox.checked;
            alert('Erreur lors de la modification');
        }
    });
}

/**
 * Supprime les anciennes annonces
 */
function supprimerAnciennesAnnonces() {
    msg.innerText = "";
    appelAjax({
        url: 'ajax/deleteold.php',
        success: (data) => {
            for (const element of data) {
                document.getElementById(element.id)?.remove();
            }
            if (data.length === 0) {
                msg.innerHTML = genererMessage('Aucune annonce à supprimer', 'orange', 2000);
            } else if (data.length === 1) {
                msg.innerHTML = genererMessage('1 annonce supprimée', 'vert', 2000);
            } else {
                msg.innerHTML = genererMessage(data.length + ' annonces supprimées', 'vert', 2000);
            }
        },
        error: () => {
            msg.innerHTML = genererMessage('Erreur lors de la suppression', 'rouge', 3000);
        }
    });
}

/**
 * Crée la colonne des actions
 * @param {number} id
 * @returns {HTMLTableCellElement}
 */
function creerColonneAction(id) {
    const actionModifier = () => location.href = '/administration/annonce/maj/?id=' + id;
    const actionSupprimer = () => confirmer(() => supprimer(id));

    const btnModifier = creerBoutonModification(actionModifier);
    const btnSupprimer = creerBoutonSuppression(actionSupprimer);

    btnModifier.setAttribute('aria-label', 'Modifier l\'annonce');
    btnSupprimer.setAttribute('aria-label', 'Supprimer l\'annonce');

    const tdAction = getTd('');
    tdAction.appendChild(btnModifier);
    tdAction.appendChild(btnSupprimer);

    return tdAction;
}

/**
 * Crée la colonne de la case à cocher actif
 * @param {number} id
 * @param {number} actif
 * @returns {HTMLTableCellElement}
 */
function creerColonneActif(id, actif) {
    const checkbox = creerCheckbox();
    checkbox.checked = actif === 1;
    checkbox.setAttribute('aria-label', 'Activer/Désactiver l\'annonce');

    checkbox.onchange = () => modifierActif(checkbox, id);

    const tdActif = getTd('', {centrer: true});
    tdActif.appendChild(checkbox);

    return tdActif;
}

/**
 * Crée une ligne de tableau représentant une annonce
 * @param {Object} annonce - Objet annonce avec id, dateFr, nom, actif
 * @returns {HTMLTableRowElement}
 */
function creerLigneAnnonce(annonce) {
    const {id, dateFr, nom, actif} = annonce;

    const tr = getTr([]);
    tr.id = id;

    // Création et ajout des colonnes
    tr.appendChild(creerColonneAction(id));
    tr.appendChild(getTd(dateFr));
    tr.appendChild(getTd(nom));
    tr.appendChild(creerColonneActif(id, actif));

    return tr;
}

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

for (const annonce of lesAnnonces) {
    lesLignes.appendChild(creerLigneAnnonce(annonce));
}