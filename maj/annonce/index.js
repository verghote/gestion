"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {appelAjax, modifierColonne, supprimerEnregistrement} from '/composant/fonction/ajax.js';
import {confirmer, afficherToast} from '/composant/fonction/afficher.js';

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
deleteOld.onclick = () => confirmer(() => delOld());

// -----------------------------------------------------------------------------------
// Fonctions de traitement
// -----------------------------------------------------------------------------------

/**
 * Supprime les anciennes annonces
 */
function delOld() {
    msg.innerText = "";

    appelAjax({
        url: 'ajax/deleteold.php',
        success: (data) => {
            for (const element of data) {
                const ligne = document.getElementById(element.id);
                if (ligne) {
                    ligne.classList.add('fade-out');
                    setTimeout(() => ligne.remove(), 500);
                }
            }
            let message;
            if (data.length > 1) {
                message = data.length + " annonces supprimées.";
            } else if (data.length === 1) {
                message = "Une annonce supprimée.";
            } else {
                message = "Aucune annonce supprimée.";
            }
            afficherToast(message);
        }
    });
}

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------


// Insertion des annonces dans la balise tbody
for (const element of lesAnnonces) {
    const id = element.id;
    const tr = lesLignes.insertRow();
    tr.id = id;
    tr.style.verticalAlign = 'middle';

    // Colonne permettant de demander la suppression ou la modification de l'annonce
    let td = tr.insertCell();

    // Container flex pour les boutons
    const container = document.createElement('div');
    container.style.display = 'flex';
    container.style.gap = '8px'; // Espace entre les icônes
    container.style.alignItems = 'center'; // Centrage vertical

    // Bouton modifier
    const btnModifier = document.createElement('span');
    btnModifier.textContent = '✎';
    btnModifier.style.color = 'orange';
    btnModifier.style.cursor = 'pointer';
    btnModifier.title = 'Modifier';
    btnModifier.onclick = () => location.href = 'maj.php?id=' + id;
    container.appendChild(btnModifier);

    // Bouton supprimer
    const btnSupprimer = document.createElement('span');
    btnSupprimer.textContent = '✘';
    btnSupprimer.style.color = 'red';
    btnSupprimer.style.cursor = 'pointer';
    btnSupprimer.title = 'Supprimer';
    // Fonction de rappel exécutée en cas de succès de la suppression
    let success = (reponse) => {
        document.getElementById(id)?.remove();
    };
    // fonction à lancer si la demande de confirmation est validée
    const supprimer = () => {
        supprimerEnregistrement('annonce', id, success);
    };

    // demander la confirmation avant de lancer la fonction
    btnSupprimer.onclick = () => confirmer(supprimer);
    container.appendChild(btnSupprimer);

    td.appendChild(container);


    // Colonne date
    tr.insertCell().innerText = element.dateFr;

    // colonne nom
    tr.insertCell().innerText = element.nom;

    // colonne active contenant une case à cocher
    td = tr.insertCell();
    td.style.textAlign = 'center';
    const inputActif = document.createElement('input');
    inputActif.type = 'checkbox';
    inputActif.classList.add('form-check-input');
    inputActif.checked = element.actif === 1;
    inputActif.onchange = () => {
        const valeur = inputActif.checked ? 1 : 0;
        modifierColonne('annonce', 'actif', valeur, id);
    };
    td.appendChild(inputActif);
}
