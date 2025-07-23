"use strict";

// Version 2025.2
// Date version : 12/07/2025

/**
* Module générique de gestion d'étapes pour une interface utilisateur.
*
* Fonctionnalités :
*   - Affichage d'une étape à la fois
*   - Ajout dynamique de boutons "Précédent" / "Suivant"
*   - Affichage de l'indication "Étape x / y"
*   - Callback facultative appelée uniquement à la dernière étape
*
* Utilisation :
*   - initialiserEtapes();                      → sans callback
*   - initialiserEtapes(maFonctionDerniere);    → avec callback uniquement à la dernière étape
*/

export function initialiserEtapes(callbackDerniere = null) {
    const etapes = Array.from(document.querySelectorAll('.etape'));

    if (etapes.length === 0) {
        console.warn("Aucune <div class='etape'> trouvée dans le document.");
        return;
    }

    let etapeCourante = 0;

    /**
     * Affiche uniquement l'étape d'index donné et met à jour le titre "Étape x / y"
     *
     * @param {number} index - Index de l'étape à afficher
     */
    function afficherEtape(index) {
        for (let i = 0; i < etapes.length; i++) {
            etapes[i].style.display = (i === index) ? 'block' : 'none';

            const progressionText = etapes[i].querySelector('.progression-etape');
            if (progressionText) {
                progressionText.textContent = `Étape ${index + 1} / ${etapes.length}`;
            }
        }

        etapeCourante = index;

        // Si on est à la dernière étape et qu'une callback est fournie
        if (etapeCourante === etapes.length - 1 && typeof callbackDerniere === 'function') {
            callbackDerniere();
        }
    }

    /**
     * Crée dynamiquement les boutons de navigation
     *
     * @param {number} index - Index de l'étape en cours
     * @returns {HTMLElement} - Élément contenant les boutons
     */
    function creerBoutonsNavigation(index) {
        const container = document.createElement('div');
        container.className = 'd-flex gap-2'; // uniquement les boutons

        // Bouton "Précédent"
        if (index > 0) {
            const btnPrev = document.createElement('button');
            btnPrev.textContent = '◁ Précédent';
            btnPrev.className = 'btn btn-warning btn-sm';
            btnPrev.onclick = () => {
                afficherEtape(index - 1);
            };
            container.appendChild(btnPrev);
        } else {
            container.appendChild(document.createElement('div'));
        }

        // Bouton "Suivant"
        if (index < etapes.length - 1) {
            const btnNext = document.createElement('button');
            btnNext.textContent = 'Suivant ▷';
            btnNext.className = 'btn btn-warning btn-sm';
            btnNext.onclick = () => {
                afficherEtape(index + 1);
            };
            container.appendChild(btnNext);
        } else {
            container.appendChild(document.createElement('div'));
        }

        return container;
    }

    // Construction des éléments pour chaque étape
    etapes.forEach((etape, index) => {
        // Création du conteneur de la barre d'étape + boutons
        const ligneNavigation = document.createElement('div');
        ligneNavigation.className = 'd-flex justify-content-between align-items-center mb-3';

        // Partie gauche : Étape x / y
        const progressionText = document.createElement('div');
        progressionText.className = 'progression-etape fw-bold';
        progressionText.textContent = `Étape ${index + 1} / ${etapes.length}`;
        ligneNavigation.appendChild(progressionText);

        // Partie droite : Boutons
        const boutons = creerBoutonsNavigation(index);
        ligneNavigation.appendChild(boutons);

        // Insertion dans l'étape
        etape.insertBefore(ligneNavigation, etape.firstChild);

    });

    // Affichage initial
    afficherEtape(0);
}
