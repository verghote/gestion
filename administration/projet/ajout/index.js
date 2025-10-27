"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {appelAjax} from "/composant/fonction/ajax.js";
import {configurerFormulaire, donneesValides } from "/composant/fonction/formulaire.js";
import {messageBox, retournerVers} from "/composant/fonction/afficher.js";
import {initialiserEtapes} from "/composant/fonction/etape.js";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

/* global lesCompetencesBloc1 */

// récupération des éléments de l'interface
const nom = document.getElementById('nom');
const msg = document.getElementById('msg');
const btnEnregistrer = document.getElementById('btnEnregistrer');
const listeCompetence = document.getElementById('listeCompetence');
const lesLignes = document.getElementById('lesLignes');

// tableau pour conserver les compétences sélectionnées
let lesCompetencesDuProjet = [];

// -----------------------------------------------------------------------------------
// Procédures évènementielles
// -----------------------------------------------------------------------------------


btnEnregistrer.onclick = () => {
    // vérification sur le champ nom
    if (donneesValides()) {
        // il faut au moins une compétence
        if (lesCompetencesDuProjet.length === 0) {
            messageBox('Il faut associer au moins une compétence au projet', 'error');
        } else {
            enregistrer();
        }
    } else {
        messageBox("Des données sont manquantes ou incorrectes, veuillez vérifier votre saisie", 'error');
    }
};


// -----------------------------------------------------------------------------------
// Fonctions de traitement
// -----------------------------------------------------------------------------------

/**
 * Demande d'enregistrement du projet avec ses compétences
 */
function enregistrer() {
    msg.innerHTML = '';
    appelAjax({
        url: 'ajax/enregistrer.php',
        data: {
            nom: nom.value,
            lesCompetences: JSON.stringify(lesCompetencesDuProjet)
        },
        success: () => retournerVers('Projet enregistré', '/administration/projet/liste')
    });
}

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

// initialisation des étapes
initialiserEtapes();

// mise en place des balises div de class 'messageErreur' sur chaque champ de saisie
configurerFormulaire();

// alimentation de la div listeCompetence qui affiche toutes les compétences du bloc 1 sous la forme de case à cocher
for (const competence of lesCompetencesBloc1) {
    let div = document.createElement('div');
    div.classList.add("d-flex", "mb-1");
    let uneCase = document.createElement('input');
    uneCase.type = 'checkbox';
    uneCase.classList.add("form-check-input", "my-auto", "m-3");
    uneCase.style.width = '25px';
    uneCase.style.height = '25px';
    // pour permettre de récupérer toutes les cases
    uneCase.name = 'competence';

    // le clic sur une case à cocher déclenche la mise à jour du tableau des compétences du projet (ajout ou suppression)
    uneCase.onclick = function () {
        let action = uneCase.checked ? "add" : "delete";
        if (action === "add") {
            // ajout de la compétence dans le tableau
            lesCompetencesDuProjet.push(competence.id);
            // ajout d'une ligne dans la liste des compétences sélectionnées
            const tr = lesLignes.insertRow();
            tr.id = competence.id;
            tr.insertCell().innerText = competence.libelle;

        } else {
            // suppression de la compétence du tableau
            const index = lesCompetencesDuProjet.findIndex(id => id === competence.id);
            lesCompetencesDuProjet.splice(index, 1);
            // suppression de la ligne dans la liste des compétences sélectionnées
            document.getElementById(competence.id)?.remove();
        }
    };
    div.appendChild(uneCase);
    let label = document.createElement('label');
    label.innerText = competence.libelle;
    label.classList.add("my-auto");
    div.appendChild(label);
    listeCompetence.appendChild(div);
}