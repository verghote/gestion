"use strict";

// Version 2025.3
// Date version : 05/07/2025

/**
 * Génère un élément HTML de type <table> à partir des données et options fournies.
 *
 * @param {object} option Objet contenant les paramètres de configuration :
 *   - data : tableau d'objets représentant les lignes
 *   - id : (string) identifiant à appliquer à la table
 *   - style : (string) style CSS appliqué à la table
 *   - columns : (array) liste des clés (colonnes) à afficher
 *   - headers : (object) dictionnaire clé => titre affiché dans l'en-tête
 *   - widths : (object) dictionnaire clé => largeur CSS de colonne
 *   - headStyle : (object) styles CSS à appliquer aux cellules de l'en-tête
 *   - bodyStyle : (object) styles CSS à appliquer aux cellules du corps
 *   - class : (object) dictionnaire clé => nom(s) de classe CSS à appliquer
 *
 * @returns {HTMLTableElement} L’élément <table> généré.
 */
export function creerTable(option) {
    // Récupère les données à afficher, ou un tableau vide par défaut
    const lesElements = option.data || [];

    // Récupère les titres de colonnes (headers) s'ils existent
    const lesEntetes = option.headers || {};

    // Récupère les largeurs de colonnes s'il y en a
    const lesLargeurs = option.widths || {};

    // Styles personnalisés à appliquer aux cellules de l'en-tête
    const headStyle = option.headStyle || {};

    // Styles personnalisés à appliquer aux cellules du corps
    const bodyStyle = option.bodyStyle || {};

    // Classes CSS à appliquer aux colonnes spécifiques
    const lesClasses = option.class || {};

    // ID et style global de la table
    const id = option.id || '';
    const style = option.style || '';

    // Détermine dynamiquement les colonnes à afficher :
    // - Si "columns" est fourni et non vide, on l'utilise
    // - Sinon, on prend les clés de "headers" s'il y en a
    // - Sinon, on prend les clés du premier objet de "data" (si présent)
    const lesColonnes = option.columns && option.columns.length > 0
        ? option.columns
        : Object.keys(lesEntetes).length > 0
            ? Object.keys(lesEntetes)
            : Object.keys(lesElements[0] || {});

    // Création de l'élément <table>
    const table = document.createElement('table');
    table.id = id;                     // Applique l'ID s'il y en a un
    table.style.cssText = style;      // Applique le style global

    // Création de l'en-tête <thead>
    const thead = table.createTHead();
    const trHead = thead.insertRow(); // Ligne de l'en-tête

    // Pour chaque colonne définie, créer une cellule <th> correspondante
    for (const colonne of lesColonnes) {
        const th = document.createElement('th');

        // Utilise l'en-tête fourni, sinon la clé brute
        th.innerHTML = lesEntetes[colonne] || colonne;

        // Applique un style spécifique si défini
        th.style.cssText = headStyle[colonne] || '';

        // Ajoute une ou plusieurs classes CSS si défini
        if (lesClasses[colonne]) {
            th.classList.add(lesClasses[colonne]);
        }

        // Applique une largeur spécifique si définie
        if (lesLargeurs[colonne]) {
            th.style.width = lesLargeurs[colonne];
        }

        // Ajoute la cellule à la ligne de l'en-tête
        trHead.appendChild(th);
    }

    // Création du corps <tbody> de la table
    const tbody = table.createTBody();

    // Pour chaque élément (ligne) de données
    for (const ligne of lesElements) {
        const tr = tbody.insertRow(); // Création d’une ligne <tr>

        // Pour chaque colonne, créer une cellule <td>
        for (const colonne of lesColonnes) {
            const td = tr.insertCell();

            // Remplit la cellule avec la valeur ou vide si undefined/null
            td.innerHTML = ligne[colonne] ?? '';

            // Applique un style personnalisé à la cellule
            td.style.cssText = bodyStyle[colonne] || '';

            // Ajoute une classe CSS si définie pour cette colonne
            if (lesClasses[colonne]) {
                td.classList.add(lesClasses[colonne]);
            }
        }
    }

    // Retourne l'objet table finalisé
    return table;
}

