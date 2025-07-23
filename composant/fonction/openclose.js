"use strict";

// Version 2025.3
// Date : 17/07/2025

const CLE_STORAGE = 'etatCartes';
let etats = JSON.parse(localStorage.getItem(CLE_STORAGE)) || {};

/**
 * Sauvegarde les états dans le localStorage
 */
function sauvegarderEtats() {
    localStorage.setItem(CLE_STORAGE, JSON.stringify(etats));
}

/**
 * Affiche ou masque un contenu, met à jour l'icône associée et sauvegarde l'état
 * @param {HTMLElement} contenu - Élément à afficher/masquer
 * @param {HTMLElement} icone - Élément icône à modifier
 * @param {string} id - Identifiant de la carte
 * @param {boolean} [forcerEtat] - true pour afficher, false pour masquer, sinon toggle
 */
export function basculerAffichage(contenu, icone, id, forcerEtat) {
    const visible = window.getComputedStyle(contenu).display !== 'none';
    const afficher = (forcerEtat !== undefined) ? forcerEtat : !visible;

    contenu.style.display = afficher ? '' : 'none';
    icone.classList.toggle('iconeOuvrir', !afficher);
    icone.classList.toggle('iconeFermer', afficher);

    etats[id] = afficher;
    sauvegarderEtats();
}

/**
 * Récupère les éléments d'une carte : en-tête, contenu, icône, identifiant
 * @param {HTMLElement} carte
 * @param {number|null} index
 * @returns {{entete: HTMLElement, contenu: HTMLElement, icone: HTMLElement|null, id: string}|null}
 */
export function obtenirElementsCarte(carte, index = null) {
    const entete = carte.querySelector('.card-header');
    if (!entete) {
        return null;
    }
    const contenu = [...carte.children].find(child =>
        child !== entete && !child.classList.contains('card-header')
    );
    if (!contenu) {
        return null;
    }
    const id = carte.id || (index !== null ? `carte-${index}` : null);
    if (!id) {
        console.warn("Carte sans identifiant ni index fourni :", carte);
        return null;
    }
    const icone = entete.querySelector('.iconeOuvrir, .iconeFermer');
    return { entete, contenu, icone, id };
}

/**
 * Initialisation d'une carte
 * @param {HTMLElement} carte
 * @param {number|null} index
 */
export function initialiserCarte(carte, index = null) {
    const elements = obtenirElementsCarte(carte, index);
    if (!elements)   {
        return;
    }
    const { entete, contenu, icone, id } = elements;
    const visible = etats[id] !== undefined ? etats[id] : window.getComputedStyle(contenu).display !== 'none';
    contenu.style.display = visible ? '' : 'none';
    let nouvelleIcone = icone;
    if (!icone) {
        nouvelleIcone = document.createElement('i');
        nouvelleIcone.classList.add(visible ? 'iconeFermer' : 'iconeOuvrir', 'float-end');
        entete.appendChild(nouvelleIcone);
    } else {
        nouvelleIcone.classList.toggle('iconeOuvrir', !visible);
        nouvelleIcone.classList.toggle('iconeFermer', visible);
    }
    entete.style.cursor = 'pointer';
    entete.onclick = () => basculerAffichage(contenu, nouvelleIcone, id);
}

/**
 * Initialise toutes les cartes présentes dans le document
 */
export function initialiserToutesLesCartes() {
    document.querySelectorAll('.card').forEach((carte, index) => {
        initialiserCarte(carte, index);
    });
}

/**
 * Initialise une liste de cartes à partir de leurs identifiants
 * @param {string[]} ids
 */
export function initialiserCartesParIds(ids) {
    ids.forEach(id => {
        const carte = document.getElementById(id);
        if (carte) {
            initialiserCarte(carte);
        } else {
            console.warn(`Carte introuvable avec l'ID : ${id}`);
        }
    });
}

/**
 * Affiche ou masque toutes les cartes
 * @param {boolean} afficher
 */
export function basculerToutesLesCartes(afficher) {
    document.querySelectorAll('.card').forEach((carte, index) => {
        const el = obtenirElementsCarte(carte, index);
        if (el && el.icone) {
            basculerAffichage(el.contenu, el.icone, el.id, afficher);
        }
    });
}

/**
 * Réinitialise tous les états enregistrés
 */
export function reinitialiserEtatsCartes() {
    etats = {};
    localStorage.removeItem(CLE_STORAGE);
}

/**
 * Injecte les styles nécessaires (une seule fois)
 */
function injecterStylesIcones() {
    if (document.getElementById('stylesToggleCartes')) {
        return;
    }
    const style = document.createElement('style');
    style.id = 'stylesToggleCartes';
    style.textContent = `
        .iconeOuvrir::before {
            content: '▼';
        }
        .iconeFermer::before {
            content: '▲';
        }
        .float-end {
            float: right;
        }
    `;
    document.head.appendChild(style);
}

// Injecte les styles au chargement du module
injecterStylesIcones();
