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

// Demande de suppression des anciennes annonces
deleteOld.onclick = () => confirmer(delOld);

// -----------------------------------------------------------------------------------
// Fonctions de traitement
// -----------------------------------------------------------------------------------

/**
 *  Fonction principale d’affichage des annonces
 */
function afficherLesAnnonces() {
    lesLignes.innerHTML = '';
    for (const annonce of lesAnnonces) {
        const ligne = creerLigneAnnonce(annonce);
        lesLignes.appendChild(ligne);
    }
}


/**
 * Crée et retourne une ligne de tableau représentant une annonce.
 * @param {object} annonce - Objet annonce avec id, dateFr, nom, actif
 * @returns {HTMLTableRowElement}
 */
function creerLigneAnnonce(annonce) {
    const { id, dateFr, nom, actif } = annonce;

    // 1. Colonne des actions (modifier / supprimer)
    const actionModifier = () => location.href = '/administration/annonce/maj/?id=' + id;

    const supprimer = () =>
        appelAjax({
            url: '/ajax/supprimer.php',
            data: { table: 'annonce', id: id },
            success: () => tr.remove()
        });

    const actionSupprimer = () => confirmer(supprimer);


    const btnModifier = creerBoutonModification(actionModifier);
    const btnSupprimer = creerBoutonSuppression(actionSupprimer);

    const tdAction = getTd('');
    tdAction.appendChild(btnModifier);
    tdAction.appendChild(btnSupprimer);

    // 2. Colonne date
    const tdDate = getTd(dateFr);

    // 3. Colonne nom
    const tdNom = getTd(nom);

    // 4. Colonne case à cocher actif
    const checkbox = creerCheckbox();
    checkbox.checked = actif === 1;
    checkbox.onchange = () => {
        const valeur = checkbox.checked ? 1 : 0;
        appelAjax({
            url: '/ajax/modifiercolonne.php',
            data: {
                table: 'annonce',
                colonne: 'actif',
                valeur: valeur,
                id: id,
            }
        });
    };

    const tdActif = getTd('', { centrer: true });
    tdActif.appendChild(checkbox);

    // Création de la ligne
    const tr = getTr([tdAction, tdDate, tdNom, tdActif]);
    tr.id = id;

    return tr;
}

/**
 * Supprime les anciennes annonces
 */
function delOld() {
    msg.innerText = "";
    appelAjax({
        url: 'ajax/deleteold.php',
        success: (data) => {
            for (const element of data) {
                document.getElementById(element.id).remove();
            }
            msg.innerHTML = genererMessage('Suppression effectuée', 'success', 2000);
        }
    });
}

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

afficherLesAnnonces();
