"use strict";

// -----------------------------------------------------------------------------------
// Import des competences nécessaires
// -----------------------------------------------------------------------------------
import {appelAjax} from "/composant/fonction/ajax.js";
import {creerCheckbox} from "/composant/fonction/formulaire.js";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

/* global lesCompetencesBloc1, lesIdCompetencesProjet, projet */

// récupération des éléments du DOM
const nom = document.getElementById('nom');
const listeCompetence = document.getElementById('listeCompetence');
const btnSupprimerTout = document.getElementById('btnSupprimerTout');
const btnAjouterTout = document.getElementById('btnAjouterTout');

// -----------------------------------------------------------------------------------
// procédures évènementielles
// -----------------------------------------------------------------------------------

btnSupprimerTout.onclick = () => supprimerToutesLesCompetences(projet.id);
btnAjouterTout.onclick = () => ajouterToutesLesCompetences(projet.id);

// -----------------------------------------------------------------------------------
// Fonctions de traitement
// -----------------------------------------------------------------------------------

/**
 * Suppression de tous les droits de l'administrateur actuellement sélectionné sur l'interface
 * Toutes les cases sont décochées sur l'interface
 */
function supprimerToutesLesCompetences(id) {
    appelAjax({
        url: 'ajax/supprimertous.php',
        data: {idProjet : id},
        success: decocherToutesLesCases
    });
}

/**
 * Ajouter tous les droits
 * Toutes les cases sont cochées sur l'interface
 */
function ajouterToutesLesCompetences(id) {
    // appel ajax pour ajouter tous les droits
    appelAjax({
        url: 'ajax/ajoutertous.php',
        data: {idProjet : id},
        success: cocherToutesLesCases,
    });
}

function decocherToutesLesCases() {
    for (const input of document.getElementsByName("competence")) {
        input.checked = false;
    }
}

function cocherToutesLesCases() {
    for (const input of document.getElementsByName("competence")) {
        input.checked = true;
    }
}

function ajouterCompetence(id, input) {
    appelAjax({
        url: 'ajax/ajouter.php',
        data: {idProjet : projet.id, idCompetence: id},
        error: () => input.checked = false
    });
}

function supprimerCompetence(id, input) {
    appelAjax({
        url: 'ajax/supprimer.php',
        data: {idProjet : projet.id, idCompetence: id},
        error: () => input.checked = true
    });
}


/**
 * Crée une ligne DOM complète contenant :
 * - une case à cocher configurée
 * - un label affichant le libellé de la compétence
 *
 * @param {Object} competence - Objet contenant { id, libelle }
 * @returns {HTMLDivElement}
 */
function creerLigneCompetence(competence) {
    const { id, libelle } = competence;

    const input = creerCheckbox();
    input.id = id;
    input.name = 'competence'; // pour pouvoir récupérer toutes les cases facilement

    // Gestion du clic (AJAX + rollback en cas d’erreur)
    input.onclick = () => {
        if (input.checked) {
            ajouterCompetence(id, input);
        } else {
            supprimerCompetence(id, input);
        }
    };

    // Création du label
    const label = document.createElement('label');
    label.innerText = libelle;
    label.classList.add("my-auto");

    // Création de la ligne (div contenant case + label)
    const div = document.createElement('div');
    div.classList.add("d-flex", "mb-1");
    div.appendChild(input);
    div.appendChild(label);

    return div;
}



// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

// afficher le nom du projet dans le formulaire de gestion
nom.innerText = projet.nom;

// afficher toutes les competences du bloc 1 sous forme de case à cocher
for (const competence of lesCompetencesBloc1) {
    const ligne = creerLigneCompetence(competence);
    listeCompetence.appendChild(ligne);
}

// cocher les cases des compétences du projet
for (const competence of lesIdCompetencesProjet) {
    document.getElementById(competence.idCompetence).checked = true;
}

