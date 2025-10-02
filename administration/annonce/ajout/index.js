"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {appelAjax} from "/composant/fonction/ajax.js";
import {retournerVersApresConfirmation} from '/composant/fonction/afficher.js';
import {configurerDate, configurerFormulaire, donneesValides } from '/composant/fonction/formulaire.js';
import {getDateRelative} from '/composant/fonction/date.js';
import {initialiserEtapes} from '/composant/fonction/etape.js';

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

/*global tinymce */

// récupération des élements de l'interface
let nom = document.getElementById('nom');
let date = document.getElementById('date');
let description = document.getElementById('description');
let btnAjouter = document.getElementById('btnAjouter');

// -----------------------------------------------------------------------------------
// Procédures évènementielles
// -----------------------------------------------------------------------------------

btnAjouter.onclick = () => {
    // récupération de la valeur du composant tinymce
    description.value = tinymce.get('description').getContent();
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
            table: 'annonce',
            nom: nom.value,
            description: description.value,
            date: date.value
        },
        success: () => {
            retournerVersApresConfirmation("Annonce enregistrée", "/administration/annonce/liste");
        }
    });
}

// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

initialiserEtapes();

// Mise en place des balises div de class 'messageErreur' sur chaque champ de saisie
configurerFormulaire();

// Initialisation de TinyMCE
tinymce.init({
    license_key: 'gpl',
    selector: '#description',
    height: 300,
    menubar: false,
    plugins: 'link lists image',
    toolbar: [
        'styles | bold italic underline | forecolor backcolor | fontsizeselect | link | image |bullist numlist'
    ],
    fontsize_formats: '8pt 10pt 12pt 14pt 18pt 24pt 36pt',
});

// Contrôle dynamique sur les champs de saisi
// La date doit être comprise entre la date du jour et un an après

const min = getDateRelative("annee", 0); // un an avant
const max = getDateRelative("annee", 1); // un an après
const valeur = getDateRelative("mois",2); // une annonce est souvent réalisée 2 mois à l'avance

configurerDate(date, {
    min: min,
    max: max,
    valeur: valeur
});

// Données de test
nom.value = 'COURSE SOLIDAIRE FEMININE';
description.value = `La 16ème édition de la Course Solidaire Féminine se déroulera dans le cadre de la Journée Internationale des Droits de la Femme, le dimanche 8 mars 2026, au parc de la Hotoie d’Amiens.
Cette course est organisée par l’US Camon Athlétisme.
L’objectif de cette course est d’encourager la pratique du sport chez les femmes. Pour cette raison, la distance est volontairement limitée à 5 km afin que les débutantes puissent en faire un premier objectif atteignable en un temps de préparation raisonnable.`;
date.value = "2026-03-08";
