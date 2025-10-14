"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {ucWord} from "/composant/fonction/format.js";
import {activerTri } from "/composant/fonction/tableau.js";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

/* global lesCoureurs */

const lesLignes = document.getElementById('lesLignes');
const nb = document.getElementById('nb');
const search = document.getElementById('search');

// -----------------------------------------------------------------------------------
// Procédures évènementielles
// -----------------------------------------------------------------------------------

search.oninput = () => afficher(lesCoureurs);

// -----------------------------------------------------------------------------------
// Fonctions de traitement
// -----------------------------------------------------------------------------------

function afficher(lesCoureurs) {
    const valeur = search.value.toLowerCase();

    lesLignes.innerHTML = '';
    let count = 0;

    for (const coureur of lesCoureurs) {
        // Filtrage direct, sans créer un nouveau tableau
        if (
            valeur &&
            !coureur.licence.toLowerCase().includes(valeur) &&
            !coureur.nomPrenom.toLowerCase().includes(valeur) &&
            !coureur.nomClub.toLowerCase().includes(valeur)
        ) {
            continue; // on passe au suivant
        }

        count++;

        const tr = lesLignes.insertRow();
        tr.style.verticalAlign = 'middle';
        tr.id = coureur.id;

        let td;

        td = tr.insertCell();
        td.innerText = coureur.licence;
        td.style.textAlign = 'center';

        td = tr.insertCell();
        td.innerText = ucWord(coureur.nomPrenom);
        td.style.textAlign = 'left';

        td = tr.insertCell();
        td.innerText = coureur.sexe;
        td.style.textAlign = 'center';

        td = tr.insertCell();
        td.innerText = coureur.dateNaissanceFr;
        td.style.textAlign = 'center';

        td = tr.insertCell();
        td.innerText = coureur.idCategorie;
        td.style.textAlign = 'center';

        td = tr.insertCell();
        td.innerText = ucWord(coureur.nomClub);
        td.style.textAlign = 'left';

        td = tr.insertCell();
        td.innerText = coureur.ffa ? 'Oui' : 'Non';
        td.style.textAlign = 'center';

        tr.insertCell().innerText = coureur.email;
        tr.insertCell().innerText = coureur.telephone;

    }

    nb.innerText = count;
}


// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

afficher(lesCoureurs);

activerTri({
    idTable: "leTableau",
    getData: () => lesCoureurs,
    afficher: afficher,
    triInitial: {
        colonne: 'licence',
        ordre: "asc"
    }
});


