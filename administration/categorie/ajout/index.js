"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {appelAjax} from "/composant/fonction/ajax.js";
import {retournerVers} from "/composant/fonction/afficher.js";
import {filtrerLaSaisie, configurerFormulaire, donneesValides } from "/composant/fonction/formulaire.js";
import {ucFirst} from '/composant/fonction/format.js';

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------


const id = document.getElementById('id');
const nom = document.getElementById('nom');
const ageMin = document.getElementById('ageMin');
const ageMax = document.getElementById('ageMax');
let msg = document.getElementById('msg');
const btnAjouter = document.getElementById('btnAjouter');

// Données de test
id.value = 'BE';
nom.value = 'Benjamin';
ageMin.value = 11;
ageMax.value = 13;

// demande d'ajout d'une catégorie

btnAjouter.onclick = () => {
    msg.innerHTML = '';
    id.value = id.value.trim().toUpperCase();
    nom.value = ucFirst(nom.value.trim());
    if (donneesValides()) {
        ajouter();
    }
};

// -----------------------------------------------------------------------------------
// Fonctions de traitement
// -----------------------------------------------------------------------------------

function ajouter() {
    appelAjax({
        url: '/ajax/ajouter.php',
        data: {
            table : 'categorie',
            id: id.value,
            nom: nom.value,
            ageMin : ageMin.valueAsNumber,
            ageMax : ageMax.valueAsNumber
        },
        success: () => {
                retournerVers("Catégorie enregistrée", "/administration/categorie/liste");
        }
    });
}

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------
configurerFormulaire();
filtrerLaSaisie('nom', /[A-Za-z0-9 ]/);
filtrerLaSaisie('id', /[A-Za-z0-9]/);
// un champ de type number accepte le 'e'
filtrerLaSaisie('ageMin', /[0-9]/);
filtrerLaSaisie('ageMax', /[0-9]/);

