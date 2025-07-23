"use strict"; // Active le mode strict pour éviter les erreurs silencieuses

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

/* global lesClubs */

const lesCartes = document.getElementById('lesCartes');



// -----------------------------------------------------------------------------------
// Fonctions de traitement
// -----------------------------------------------------------------------------------
/**
 * Crée une carte pour afficher les informations d'un club
 * @param {Object} element - Données du club
 * @returns {HTMLDivElement}
 */
function creerCarte(element) {
    // 📦 Création de la carte principale
    const carte = document.createElement('div');
    carte.classList.add('card', 'carte-club', 'shadow-sm');

    // Entête de la carte
    const entete = document.createElement('div');
    entete.classList.add('card-header', 'text-center');
    entete.style.height = '80px';

    // Couleurs dynamiques depuis les variables CSS
    entete.style.backgroundColor = getComputedStyle(document.documentElement).getPropertyValue('--background-color-header').trim();
    entete.style.color = getComputedStyle(document.documentElement).getPropertyValue('--text-color-header').trim();
    entete.innerText = element.nom;

    // Corps
    const corps = document.createElement('div');
    corps.classList.add('card-body');
    corps.style.height = '250px';

    if (element.present) {
        const img = document.createElement('img');
        img.src = '/data/club/' + element.fichier;
        img.alt = `${element.nom} logo`;
        img.style.maxHeight = '100%';
        img.style.maxWidth = '100%';
        img.style.objectFit = 'contain';
        img.style.display = 'block';
        img.style.margin = '0 auto'; // centrer horizontalement
        corps.appendChild(img);
    }

    // Pied de la carte
    const pied = document.createElement('div');
    pied.classList.add('card-footer', 'text-muted', 'text-center');
    pied.innerText = `${element.nb} licenciés`;

    carte.appendChild(entete);
    carte.appendChild(corps);
    carte.appendChild(pied);


    carte.style.flexGrow = '0';          // La carte ne grandit pas au-delà de sa base
    carte.style.flexShrink = '1';        // Elle peut se rétrécir si l'espace est limité
    carte.style.flexBasis = '300px';     // Largeur de base (taille cible)
    carte.style.maxWidth = '100%';       // Elle ne dépasse jamais la largeur de son conteneur

    return carte;
}

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

// Injection dynamique d'une règle CSS responsive
const style = document.createElement('style');
style.textContent = `
    @media screen and (max-width: 660px) {
        .carte-club {
            flex-basis: 100% !important;
        }
    }
`;
document.head.appendChild(style); // On ajoute la balise <style> dans le <head>

//  Mise en forme du conteneur flex
lesCartes.style.display = 'flex';              // Flexbox activé
lesCartes.style.flexWrap = 'wrap';             // Retour à la ligne si besoin
lesCartes.style.gap = '1rem';                  // Espacement entre les cartes
lesCartes.style.justifyContent = 'flex-start'; // Alignement des cartes à gauche

// Génération des cartes à partir des données
for (const element of lesClubs) {
    const carte = creerCarte(element);
    lesCartes.appendChild(carte);
}
