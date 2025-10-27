"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {getTd, getTdWithImg, getTr} from "/composant/fonction/trtd.js";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

/*global lesCategories */
const lesLignes = document.getElementById('lesLignes');

// -----------------------------------------------------------------------------------
// procédures évènementielles
// -----------------------------------------------------------------------------------

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

// affichage de la liste des catégories
for (const categorie of lesCategories) {

    // Liste des cellules
    const lesTds = [
        getTd(categorie.nom),
        getTd(categorie.id),
        getTd(categorie.age, { centrer: true }),
        getTd(categorie.annee, { centrer: true, masquer: true })
    ];
    // Ajout de la ligne dans le tbody
    lesLignes.appendChild(getTr(lesTds));
}



