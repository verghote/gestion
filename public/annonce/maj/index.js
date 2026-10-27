
"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {appelAjax} from '/composant/fonction/ajax.js';
import {
    afficherToast,
    confirmer,
    genererMessage
} from '/composant/fonction/afficher.js';
import {getData} from "/composant/fonction/page.js";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

const lesAnnonces = getData("lesAnnonces");

const lesLignes = document.getElementById('lesLignes');
const modeleLigne = document.getElementById('modeleLigne');
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
 * @param {string|number} id
 */
function supprimer(id) {
    appelAjax({
        url: 'ajax/supprimer.php',
        data: {
            primaryKey: id
        },
        success: () => document.getElementById(id)?.remove()
    });
}

/**
 * Demande de modification de la colonne actif
 * @param {HTMLInputElement} checkbox
 * @param {string|number} id
 */
function modifierActif(checkbox, id) {
    const ancienneValeur = !checkbox.checked;

    appelAjax({
        url: 'ajax/modifieractif.php',
        data: {
            primaryKey: id,
            actif: checkbox.checked ? 1 : 0
        },
        success: () => afficherToast(
            checkbox.checked ? 'Annonce activée' : 'Annonce désactivée',
            'vert'
        ),
        error: () => {
            checkbox.checked = ancienneValeur;
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
        success: (lesIdsSupprimes) => {
            for (const id of lesIdsSupprimes) {
                document.getElementById(id)?.remove();
            }

            if (lesIdsSupprimes.length === 0) {
                msg.innerHTML = genererMessage(
                    'Aucune annonce à supprimer',
                    'orange',
                    2000
                );
            } else if (lesIdsSupprimes.length === 1) {
                msg.innerHTML = genererMessage(
                    'Une annonce supprimée',
                    'vert',
                    2000
                );
            } else {
                msg.innerHTML = genererMessage(
                    lesIdsSupprimes.length + ' annonces supprimées',
                    'vert',
                    2000
                );
            }
        }
    });
}

/**
 * Crée une ligne de tableau représentant une annonce
 * @param {Object} annonce
 * @returns {HTMLTableRowElement}
 */
function creerLigneAnnonce(annonce) {
    const {id, dateFr, nom, actif} = annonce;

    // Cloner le template
    const tr = modeleLigne.content.firstElementChild.cloneNode(true);
    tr.id = id;

    // Récupérer les éléments
    const btnModifier = tr.querySelector('.btn-modifier');
    const btnSupprimer = tr.querySelector('.btn-supprimer');
    const tdDate = tr.querySelector('.td-date');
    const tdNom = tr.querySelector('.td-nom');
    const checkbox = tr.querySelector('.checkbox-actif');

    // Alimenter les données
    tdDate.textContent = dateFr;
    tdNom.textContent = nom;
    checkbox.checked = actif === 1;

    // Action : modifier l'annonce
    btnModifier.addEventListener('click', () => {
        location.href = '/annonce/majannonce/?id=' + id;
    });

    // Action : supprimer l'annonce
    btnSupprimer.addEventListener('click', () => {
        confirmer(() => supprimer(id));
    });

    // Action : activer ou désactiver l'annonce
    checkbox.addEventListener('change', () => {
        modifierActif(checkbox, id);
    });

    return tr;
}

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

lesLignes.replaceChildren();

for (const annonce of lesAnnonces) {
    lesLignes.appendChild(creerLigneAnnonce(annonce));
}
