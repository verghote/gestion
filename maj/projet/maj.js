"use strict";

// -----------------------------------------------------------------------------------
// Import des competences nécessaires
// -----------------------------------------------------------------------------------
import {appelAjax} from "/composant/fonction/ajax.js";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

/* global lesCompetencesBloc1, lesIdCompetencesProjet, projet */

// récupération des éléments du DOM
let nom = document.getElementById('nom');
let listeCompetence = document.getElementById('listeCompetence');
let btnSupprimerTout = document.getElementById('btnSupprimerTout');
let btnAjouterTout = document.getElementById('btnAjouterTout');

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

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

// afficher le nom du projet dans le formulaire de gestion
nom.innerText = projet.nom;

// afficher toutes les competences du bloc 1 sous forme de case à cocher
for (const competence of lesCompetencesBloc1) {
    let div = document.createElement('div');
    div.classList.add("d-flex", "mb-1");
    let uneCase = document.createElement('input');
    uneCase.type = 'checkbox';
    uneCase.id = competence.id;
    uneCase.classList.add("form-check-input", "my-auto", "m-3");
    uneCase.style.width = '25px';
    uneCase.style.height = '25px';
    // pour permettre de récupérer toutes les cases
    uneCase.name = 'competence';

    // le clic sur une case à cocher déclenche la mise à jour des compétences du projet (ajout ou suppression)
    uneCase.onclick = function () {
        let url = uneCase.checked ? "ajax/ajouter.php" : "ajax/supprimer.php";
        const formData = new FormData();
        formData.append('idProjet', projet.id);
        formData.append('idCompetence', competence.id);
        appelAjax({
            url: url,
            data: formData,
            method: 'post',
            error: () => {
                uneCase.checked = !uneCase.checked; // on remet la case à son état initial
            }
        });
    };
    div.appendChild(uneCase);
    let label = document.createElement('label');
    label.innerText = competence.libelle;
    label.classList.add("my-auto");
    div.appendChild(label);
    listeCompetence.appendChild(div);
}

// cocher les cases des compétences du projet
for (const competence of lesIdCompetencesProjet) {
    document.getElementById(competence.idCompetence).checked = true;
}

