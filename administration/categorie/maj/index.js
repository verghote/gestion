"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {appelAjax} from "/composant/fonction/ajax.js";
import {confirmer, retournerVers, afficherSousLeChamp, messageBox} from '/composant/fonction/afficher.js';
import {
    configurerFormulaire,
    donneesValides,
    effacerLesErreurs,
    filtrerLaSaisie
} from "/composant/fonction/formulaire.js";
import {ucFirst} from "/composant/fonction/format.js";
import {comparerSansAccentEtSansCasse} from "/composant/fonction/util";


// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

/* global lesCategories */

// objet global contenant les informations sur la catégorie sélectionnée
let categorie = {};

const idR = document.getElementById('idR');
const id = document.getElementById('id');
const nom = document.getElementById('nom');
const ageMin = document.getElementById('ageMin');
const ageMax = document.getElementById('ageMax');
const nb = document.getElementById('nb');
const msg = document.getElementById('msg');
const btnModifier = document.getElementById('btnModifier');
const btnSupprimer = document.getElementById('btnSupprimer');

// -----------------------------------------------------------------------------------
// Procédures évènementielles
// -----------------------------------------------------------------------------------

// sur le changement de catégorie, il faut récupérer les informations de la catégorie
idR.onchange = () => afficher(idR.value);

// demande de modification d'une catégorie
btnModifier.onclick = () => {
    if (controler()) {
        modifier();
    }
};

// demande de suppression  de la catégorie
btnSupprimer.onclick = () => confirmer(supprimer);


/**
 * Affiche les informations de la catégorie dans les champs du formulaire
 * @param {string} idCategorie identifiant de la catégorie
 */
function afficher(idCategorie) {
    categorie = lesCategories.find(x => x.id === idCategorie);
    id.value = categorie.id;
    nom.value = categorie.nom;
    ageMin.value = categorie.ageMin;
    ageMax.value = categorie.ageMax;
    nb.innerText = categorie.nb + " licencié(s) dans cette catégorie";
    // si la catégorie ne comporte pas de licencié, on affiche le bouton de suppression
    // sinon, on le masque et on indique le nombre de licenciés
    if (categorie.nb === 0) {
        btnSupprimer.style.display = "block";
        nb.innerText = "Aucun licencié dans cette catégorie";
    } else {
        btnSupprimer.style.display = "none";
        nb.innerText = `${categorie.nb} ${categorie.nb === 1 ? "licencié" : "licenciés"} dans cette catégorie`;
    }
    // vider l'éventuel message d'erreur
    msg.innerText = '';
}

/**
 * controle les données saisies dans le formulaire
 * @returns {boolean}
 */
function controler() {

    // effacer les anciens messages d'erreur
    effacerLesErreurs();

    nom.value = ucFirst(nom.value.trim());
    if (!donneesValides()) {
        return;
    }
    let valide = true;

    // vérification de l'id
    if (!idUnique(id.value)) {
        afficherSousLeChamp('idR', "L'identifiant de la catégorie doit être unique");
        valide = false;
    }
    // vérification de l'unicité du nom
    if (!nomUnique(nom.value)) {
        afficherSousLeChamp('nom', "Le nom de la catégorie doit être unique");
        valide = false;
    }
    // vérification de l'intervale d'âge
    const min = ageMin.valueAsNumber;
    const max = ageMax.valueAsNumber;
    if (min >= max) {
        afficherSousLeChamp('ageMin', "L'âge minimum doit être inférieur à l'âge maximum");
        valide = false;
    } else {
        // vérification de la plage d'âge
        if (!plageValide(categorie.id, min, max)) {
            afficherSousLeChamp('ageMin', "La plage d'âge doit être cohérente avec les autres catégories");
            valide = false;
        }
    }
    return valide;
}

/**
 * Vérifie si le nom de la catégorie est unique
 * Par sécurité, nous utilisons une comparaison insensible aux accents et à la casse
 * @param {string} nom
 * @returns {boolean}
 */
function nomUnique(nom) {
    return lesCategories.findIndex(x => comparerSansAccentEtSansCasse(x.nom, nom) && x.id !== categorie.id) === -1;
}

function idUnique(id) {
    return lesCategories.findIndex(x => x.id === id && x.id !== categorie.id) === -1;
}

/**
 * Vérifie si la plage d'âge est valide et ne chevauche pas les autres catégories
 * Il n'y a pas chevauchement si max est avant ageMin ou min est après ageMax (il suffit d'inverser la condition pour trouver un chevauchement)
 *  @param {number} id id de la catégorie actuellement affichée
 * @param {number} min
 * @param {number} max
 * @returns {boolean}
 */
function plageValide(id, min, max) {
    return !lesCategories.some(x => x.id !== id && max >= x.ageMin && min <= x.ageMax);
}

/**
 * effectue la modification de la catégorie
 */
function modifier() {
    msg.innerHTML = '';
    let lesValeurs = {};
    if (id.value !== categorie.id) {
        lesValeurs.id = id.value;
    }

    if (nom.value !== categorie.nom) {
        lesValeurs.nom = nom.value;
    }
    if (ageMin.valueAsNumber !== categorie.ageMin) {
        lesValeurs.ageMin = ageMin.value;
    }
    if (ageMax.valueAsNumber!== categorie.ageMax) {
        lesValeurs.ageMax = ageMax.value;
    }
    // Vérification : si aucune clé n’a été ajoutée => pas de modification
    if (Object.keys(lesValeurs).length === 0) {
        messageBox("Aucune modification constatée !", 'error');
        return;
    }
    appelAjax({
        url: '/ajax/modifier.php',
        data: {
            table: 'categorie',
            id: categorie.id,
            lesValeurs: JSON.stringify(lesValeurs)
        },
        success: data => {
            retournerVers(data.success, '/categorie/liste');
        }
    });
}

/**
 * Demande de suppression de la catégorie actuellement affichée
 */
function supprimer() {
    appelAjax({
        url: '/ajax/supprimer.php',
        data: {
            table: 'categorie',
            id: categorie.id
        },
        success: () => {
            // on supprime la catégorie dans le tableau (facultatif)
            const index = lesCategories.findIndex(x => x.id === categorie.id);
            if (index !== -1) {
                lesCategories.splice(index, 1);
            }
            // mise à jour de la zone de liste idR
            idR.remove(idR.selectedIndex);
            // charger les données de la catégorie suivante
            afficher(idR.value);
        }
    });
}

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

configurerFormulaire();
// filtrerLaSaisie('nom', /[A-Za-z0-9 ]/);
filtrerLaSaisie('ageMin', /[0-9]/);
filtrerLaSaisie('ageMax', /[0-9]/);


// Tranformation en valeur numérique pour ageMin et AgeMax et alimentation de la zone de liste des catégories
// cela évitera les erreurs de comparaison
for (const element of lesCategories) {
    element.ageMin = parseInt(element.ageMin);
    element.ageMax = parseInt(element.ageMax);
    idR.add(new Option(element.nom + ' (' + element.id + ')', element.id));
}

// charger les informations de la catégorie actuellement sélectionnée
afficher(idR.value);

