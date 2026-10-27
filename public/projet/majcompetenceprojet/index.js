
"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {appelAjax} from "/composant/fonction/ajax.js";
import {getData} from "/composant/fonction/page.js";
import {afficherToast} from "/composant/fonction/afficher.js";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

const projet = getData("projet");
const lesCompetencesBloc1 = getData("lesCompetencesBloc1");
const lesIdCompetencesProjet = getData("lesIdCompetencesProjet");

const nom = document.getElementById('nom');
const listeCompetence = document.getElementById('listeCompetence');
const modeleCompetence = document.getElementById('modeleCompetence');

// -----------------------------------------------------------------------------------
// Fonctions de traitement
// -----------------------------------------------------------------------------------

/**
 * Ajoute une compétence au projet.
 * @param {number|string} id
 * @param {HTMLInputElement} input
 */
function ajouterCompetence(id, input) {
    appelAjax({
        url: 'ajax/ajouterunecompetence.php',
        data: {
            columns: {
                idProjet: projet.id,
                idCompetence: id
            }
        },
        success: (data) => afficherToast(data.message),
        error: () => {
            input.checked = false;
        }
    });
}

/**
 * Supprime une compétence du projet.
 * @param {number|string} id
 * @param {HTMLInputElement} input
 */
function supprimerCompetence(id, input) {
    appelAjax({
        url: 'ajax/supprimerunecompetence.php',
        data: {
            primaryKey: id
        },
        success: (data) => afficherToast(data.message),
        error: () => {
            input.checked = true;
        }
    });
}

/**
 * Crée une ligne représentant une compétence.
 * @param {Object} competence
 * @returns {HTMLDivElement}
 */
function creerLigneCompetence(competence) {
    const {id, libelle} = competence;

    // Cloner le modèle HTML
    const ligne = modeleCompetence.content.firstElementChild.cloneNode(true);

    // Récupérer les éléments
    const input = ligne.querySelector('input');
    const label = ligne.querySelector('label');

    // Configurer la case à cocher
    input.id = id;

    // Associer le libellé à la case
    label.htmlFor = id;
    label.textContent = libelle;

    // Rechercher l'association avec le projet
    const association = lesIdCompetencesProjet.find(
        c => Number(c.idCompetence) === Number(id)
    );

    if (association) {
        input.dataset.idAssociation = association.id;
        input.checked = true;
    }

    // Ajouter ou supprimer la compétence selon le nouvel état
    input.addEventListener('change', () => {
        if (input.checked) {
            ajouterCompetence(id, input);
        } else {
            supprimerCompetence(input.dataset.idAssociation, input);
        }
    });

    return ligne;
}

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

// Afficher le nom du projet
nom.textContent = projet.nom;

// Générer la liste des compétences
listeCompetence.replaceChildren();

for (const competence of lesCompetencesBloc1) {
    listeCompetence.appendChild(creerLigneCompetence(competence));
}
