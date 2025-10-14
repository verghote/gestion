"use strict";

// Version 2025.2
// Date version : 16/07/2025

/**
 * Supprime les accents d'une chaîne de caractères
 * @param str
 * @returns {*}
 */
export function enleverAccent(str) {
    return str.normalize('NFD').replace(/[\u0300-\u036f]/g, '');
}

/**
 * Supprime les accents d'une chaîne de caractères
 * @param str
 * @returns {*}
 */
export function enleverAccentEtMajuscule(str) {
    return enleverAccent(str).toLowerCase();
}

/**
 * Compare 2 chaînes sans tenir compte des accents et de la casse
 * @param {string} str1 chaîne à comparer
 * @param {string} str2 chaîne à comparer
 * @returns {boolean} true si les 2 chaînes sont identiques
 */
export function comparerSansAccentEtSansCasse(str1, str2) {
    const x = enleverAccentEtMajuscule(str1);
    const y = enleverAccentEtMajuscule(str2);
    return x === y;
}

/**
 * Compare 2 chaînes sans tenir compte de la casse
 * @param {string} str1 chaîne à comparer
 * @param {string} str2 chaîne à comparer
 * @returns {boolean} true si les 2 chaînes sont identiques
 */
export function comparerSansCasse(str1, str2) {
    return str1.toLowerCase() === str2.toLowerCase();
}

/**
 * Vérifie si une chaîne de caractères contient une autre chaîne, sans tenir compte des accents et de la casse
 * @param texte
 * @param recherche
 * @returns {*}
 */
export function contenir(texte, recherche) {
    const txt = enleverAccentEtMajuscule(texte);
    const cherche = enleverAccentEtMajuscule(recherche)
    return txt.includes(cherche);
}

/**
 * retourne le message d'erreur associé à la réponse de l'API
 * @param reponse
 * @returns {string}
 */
export function getErrorAPI(reponse) {
    if (reponse === "Not Found") {
        return "Le point d'accès appelé n'existe pas";
    }
    if (reponse === "Bad credentials") {
        return "Vos paramètres d'authentification sont incorrects";
    }
    if (reponse === "Requires authentication") {
        return "Votre demande nécessite une authentification";
    }
    if (reponse === "Repository creation failed.") {
        return "La création du référentiel a échoué";
    }
    if (reponse === "name already exists on this account") {
        return "Le nom du référentiel est déjà utilisé";
    }
    if (reponse === "Body should be a JSON object") {
        return "Votre demande ne comporte pas les paramètres attendus";
    }
    return "Echec de la demande";
}

/**
 * Met en attente l'exécution du programme pendant le nombre de millisecondes passé en paramètre
 * @param {int} ms nombre de millisecondes
 * @returns {Promise<unknown>}
 */
export function wait(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

/**
 * Vérifie si une classe CSS est déjà définie dans les styles du document.
 *
 * @param {string} nomClasse - Le nom de la classe à vérifier (sans le point)
 * @returns {boolean}
 */
/**
 * Vérifie si une classe CSS donnée est définie dans l'une des feuilles de style.
 * @param {string} nomClasse - Le nom de la classe sans le point initial (ex. "maClasse")
 * @returns {boolean} - true si une règle CSS .maClasse est présente, false sinon
 */
export function classeCssExiste(nomClasse) {
    const nomSelector = `.${nomClasse}`;

    // Parcours de toutes les feuilles de style du document
    for (const feuille of document.styleSheets) {
        try {
            // Certaines feuilles externes peuvent déclencher une erreur d'accès (Cross-Origin)
            const regles = feuille.cssRules || feuille.rules;
            if (!regles) {
                continue; // sécurité : certaines feuilles n'ont pas de règles CSS
            }

            for (const regle of regles) {
                // Vérifie que la règle est bien une règle de style avec un sélecteur
                if (regle.selectorText && regle.selectorText.split(',').some(sel => sel.trim() === nomSelector)) {
                    return true;
                }
            }

        } catch (e) {
            //  Impossible de lire cette feuille (souvent pour raison de sécurité CORS), on ignore
            // continue;
        }
    }
    return false; // aucune correspondance trouvée
}

/**
 * Ajoute dynamiquement une classe CSS si elle n'existe pas encore.
 *
 * @param {string} nomClasse - Nom de la classe à ajouter (sans point)
 * @param {string} declarationCSS - Contenu de la règle CSS
 */
export function ajouterClasseCss(nomClasse, declarationCSS) {
    if (classeCssExiste(nomClasse)) {
        return;
    }

    const style = document.createElement('style');
    style.textContent = `.${nomClasse} { ${declarationCSS} }`;
    document.head.appendChild(style);
}
