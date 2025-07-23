"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {modifierColonne, supprimerEnregistrement} from "/composant/fonction/ajax.js";
import {confirmer} from '/composant/fonction/afficher.js';
import {verifier} from "/composant/fonction/controle";

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

function afficherLesProjet() {

    lesLignes.innerHTML = "";
    for (const element of lesProjets) {
        const id = element.id;
        const tr = lesLignes.insertRow();
        tr.id = id;
        tr.style.verticalAlign = 'middle';

        // Colonne permettant de demander la suppression du projet ou la modification des compétences du projet
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
        btnModifier.title = 'Modifier les compétences';
        btnModifier.onclick = () => location.href = 'maj.php?id=' + id;
        container.appendChild(btnModifier);

        // Bouton supprimer
        const btnSupprimer = document.createElement('span');
        btnSupprimer.textContent = '✘';
        btnSupprimer.style.color = 'red';
        btnSupprimer.style.cursor = 'pointer';
        btnSupprimer.title = 'Supprimer';
        // demander la confirmation avant de lancer la suppression
        btnSupprimer.onclick = () => confirmer(() => supprimer(id));
        container.appendChild(btnSupprimer);

        td.appendChild(container);

        // colonne nom (modifiable)
        td = tr.insertCell();
        const inputNom = document.createElement('input');
        inputNom.type = 'textbox';
        inputNom.value = element.nom;
        // réglage des attributs pour la validation HTML5
        inputNom.required = true;
        inputNom.maxlength = '70';
        // sur la modification du nom du club
        inputNom.onchange = function () {
            if (verifier(this)) {
                modifierColonne('projet', 'nom', this.value, id);
            }
        };
        td.appendChild(inputNom);
    }

}


/**
 * suppression d'un administrateur
 * @param {number} id - Identifiant du membre à supprimer
 */
function supprimer(id) {
    const success = () => {
        // on supprime le projet du tableau lesProjets
        const index = lesProjets.findIndex(x => x.id === id);
        if (index !== -1) {
            lesProjets.splice(index, 1);
        }
        // on supprime le projet de l'affichage
        document.getElementById(id)?.remove();

    };
    supprimerEnregistrement('projet', id, success);
}

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

afficherLesProjet();
