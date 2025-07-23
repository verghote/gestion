"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------
import {initialiserToutesLesCartes} from "/composant/fonction/openclose.js";
import {genererMessage} from "/composant/fonction/afficher";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

/*global lesAnnonces */
const contenuCadreAnnonce = document.getElementById('contenuCadreAnnonce');

// -----------------------------------------------------------------------------------
// Fonctions de traitement
// -----------------------------------------------------------------------------------


function creerCarte(element) {
    const carte = document.createElement('div');
    carte.classList.add("card", "mb-1"); // mb-1 pour espace vertical entre cartes

    // Entête
    const entete = document.createElement('div');
    entete.classList.add("card-header", "entete");
    entete.appendChild(document.createTextNode(element.nom));
    carte.appendChild(entete);

    // Corps
    const corps = document.createElement('div');
    corps.classList.add("card-body", "text-break");
    corps.style.textAlign = "justify";
    corps.innerHTML = element.description;
    carte.appendChild(corps);

    return carte;
}

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

// les informations
let nbInformation = lesAnnonces.length;
if (nbInformation > 0) {
    for (const element of lesAnnonces) {
        const carte = creerCarte(element);
        contenuCadreAnnonce.appendChild(carte);
    }
} else {
    contenuCadreAnnonce.innerHTML = genererMessage("Aucune annonce pour le moment.", "orange");
}

// Mise en place du système d'ouverture/fermeture des cadres
initialiserToutesLesCartes();
