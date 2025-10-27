"use strict";

// -----------------------------------------------------------------------------------
// Import des fonctions nécessaires
// -----------------------------------------------------------------------------------

import {appelAjax} from "/composant/fonction/ajax.js";
import {
    confirmer,
    afficherToast, afficherSousLeChamp,
    retournerVersApresConfirmation, messageBox
} from '/composant/fonction/afficher.js';
import {
    configurerFormulaire,
    donneesValides,
    configurerDate,
    filtrerLaSaisie, enleverAccent,
    effacerLesErreurs, effacerLesChamps
} from "/composant/fonction/formulaire.js";
import {ucFirst} from '/composant/fonction/format.js';
import { initialiserEtapes } from '/composant/fonction/etape.js';
import {initAutoComplete} from "/composant/fonction/autocomplete.js";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------
/* global dateMin, dateMax, lesClubs */

// récupération des éléments de l'interface
const nom = document.getElementById('nom');
const prenom = document.getElementById('prenom');
const sexe = document.getElementById('sexe');
const dateNaissance = document.getElementById('dateNaissance');
const idClub = document.getElementById('idClub');
const ffa = document.getElementById('ffa');
const email = document.getElementById('email');
const telephone = document.getElementById('telephone');
const licence = document.getElementById('licence');
const nomR = document.getElementById('nomR');
const btnSupprimer = document.getElementById('btnSupprimer');
const btnModifierInformationsPersonnelles = document.getElementById('btnModifierInformationsPersonnelles');
const btnModifierInformationsSportives = document.getElementById('btnModifierInformationsSportives');
const zoneInformationsSportives = document.getElementById('zoneInformationsSportives');
const zoneInformationsPersonnelles = document.getElementById('zoneInformationsPersonnelles');
const msg = document.getElementById('msg');

// objet global contenant les informations du coureur actuellement affiché
let coureur = {};


// -----------------------------------------------------------------------------------
// Procédures évènementielles
// -----------------------------------------------------------------------------------

nomR.onfocus = () => {
    nomR.value = '';
    btnSupprimer.style.display = 'none';
    effacerLesChamps();
};

// le bouton 'btnSupprimer'
btnSupprimer.onclick = () => confirmer(supprimer);

btnModifierInformationsPersonnelles.onclick = () => {
    effacerLesErreurs(zoneInformationsPersonnelles);
    nom.value = enleverAccent(nom.value).trim().toUpperCase();
    prenom.value = enleverAccent(prenom.value).trim().toUpperCase();
    if (donneesValides(zoneInformationsPersonnelles)) {
        modifierInformationsPersonnelles();
    }
};

btnModifierInformationsSportives.onclick = () => {
    effacerLesErreurs(zoneInformationsSportives);
    if (donneesValides(zoneInformationsSportives)) {
        modifierInformationsSportives();
    }
};

email.onchange = function() {
    mettreAJourChampOptionnel(this);
};

telephone.onchange = function() {
    mettreAJourChampOptionnel(this);
};



// -----------------------------------------------------------------------------------
// Fonctions de traitement
// -----------------------------------------------------------------------------------

/**
 * affichage des coordonnées du coureur contenues dans le paramètre implicite data
 * On conserve les coordonnées du coureur dans l'objet coureur afin de détecter une modification
 * @param data
 */
function afficher(data) {
    // vider l'éventuel message d'erreur
    msg.innerHTML = '';

    coureur = data;
    licence.value = data.licence;
    nom.value = data.nom;
    prenom.value = data.prenom;
    sexe.value = data.sexe;
    dateNaissance.value = data.dateNaissance;
    idClub.value = data.idClub;
    ffa.checked = data.ffa === 1;
    // pour les champs optionnels la valeur null est transformée en chaine vide ''
    email.value = data.email;
    telephone.value = data.telephone;
    btnSupprimer.style.display = 'block';
    // Affichage conditionnel de l'icône
    afficherIconeSiValeur(email);
    afficherIconeSiValeur(telephone);
    // alimentation des balise span de classe 'nom'
    document.querySelectorAll('.nom').forEach(span => {
        span.textContent = ucFirst(data.nomPrenom);
    });
}

// Affiche l’icône si une valeur est présente
function afficherIconeSiValeur(input) {
    const icone = document.querySelector(`.icone-effacer[data-cible="${input.id}"]`);
    if (input.value.trim() !== '') {
        icone.style.display = 'inline';
    } else {
        icone.style.display = 'none';
    }
}


function modifierInformationsPersonnelles() {
    msg.innerHTML = '';
    let lesValeurs = {};

    if (nom.value !== coureur.nom) {
        lesValeurs.nom = nom.value;
    }

    if (prenom.value !== coureur.prenom) {
        lesValeurs.prenom = prenom.value;
    }

    if (sexe.value !== coureur.sexe) {
        lesValeurs.sexe = sexe.value;
    }
    if (dateNaissance.value !== coureur.dateNaissance) {
        lesValeurs.dateNaissance = dateNaissance.value;
    }
    // Vérification : si aucune clé n’a été ajoutée => pas de modification
    if (Object.keys(lesValeurs).length === 0) {
        messageBox("Aucune modification constatée !", 'error');
        return;
    }
    modifier(lesValeurs);
}

function modifierInformationsSportives() {
    msg.innerHTML = '';
    // transmission des paramètres
    let modif = false;
    let lesValeurs = {};

    if (licence.value !== coureur.licence) {
        lesValeurs.licence = licence.value;
        modif = true;
    }

    if (idClub.value !== coureur.idClub) {
        lesValeurs.idClub = idClub.value;
        modif = true;
    }

    if (ffa.checked !== (coureur.ffa === 1)) {
        lesValeurs.ffa = ffa.checked ? 1 : 0;
        modif = true;
    }

    if (modif === false) {
        messageBox("aucune modification constatée !", 'error');
        return;
    }
    modifier(lesValeurs);
}

/**
 * Modifier les champs
 * @param lesValeurs
 */
function modifier(lesValeurs) {
    appelAjax({
        url: '/ajax/modifier.php',
        data: {
            table: 'coureur',
            id: coureur.licence,
            lesValeurs: JSON.stringify(lesValeurs)
        },
        success: data => retournerVersApresConfirmation(data.success, '/administration/licencie/liste'),
    });}

function mettreAJourChampOptionnel(champ) {
    if (champ.value !== '') {
        afficherSousLeChamp(champ.id);
        if (champ.checkValidity()) {
            appelAjax({
                url: '/ajax/modifiercolonne.php',
                data: {
                    table: 'coureur',
                    colonne: champ.id,
                    valeur: champ.value,
                    id: licence.value,
                },
                success: reponse => {
                    afficherToast(reponse.success);
                    afficherIconeSiValeur(champ);
                }
            });

        }
    } else {
        effacerColonne(champ.id);
    }
}


function effacerColonne(colonne) {
    appelAjax({
        url: 'ajax/clearcolonne.php',
        data: {
            colonne: colonne,
            licence: licence.value
        },
        success:() => {
                afficherToast("Le contenu du champ " + colonne + " a bien été effacé");
                // on efface le contenu du champ
                const champ = document.getElementById(colonne);
                if (champ) {
                    champ.value = '';
                    // on masque l'icône d'effacement
                    const icone = document.querySelector(`.icone-effacer[data-cible="${colonne}"]`);
                    if (icone) {
                        icone.style.display = 'none';
                    }
                }
        }
    });
}


/**
 * Demande de suppression du coureur actuellement affiché
 */
function supprimer() {
    appelAjax({
        url: '/ajax/supprimer.php',
        data: {
            table: 'coureur',
            id: licence.value
        },
        success: () => {
            afficherToast('Coureur supprimé');
            nomR.focus();
        }
    });
}


// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

// intervalle sur la date de naissance
// La date doit être comprise entre dateMin et dateMax
configurerDate(dateNaissance, {
    min: dateMin,
    max: dateMax,
    valeur: dateMax
});

// initialisation des étapes
initialiserEtapes(null, [
    // Étape 0 → contrôle sur le choix du coureur
    () => {
        if (nomR.value === '' ||!coureur || !coureur.licence) {
            messageBox("Vous devez d'abord sélectionner un licencié.", 'error');
            return false;
        }
        return true;
    },
    // Étapes suivantes : pas de validation spécifique ici
    () => true,
    () => true
]);

// alimentation de la zone de liste des clubs
for (const club of lesClubs) {
    idClub.add(new Option(club.nom, club.id));
}

// paramétrage du composant autoComplete
initAutoComplete({
    selector: "#nomR",
    fetchUrl: "ajax/getbynomprenom.php",
    searchKey: "nomPrenom",
    onSelection: (selection) => {
        nomR.value = selection.nomPrenom;
        nomR.blur();
        afficher(selection);
    }
});

// contrôle des données saisies toujours après le système d'autocomplétion qui vient ajouter ses propres balises
configurerFormulaire();
filtrerLaSaisie('telephone', /[0-9]/);
filtrerLaSaisie('nom', /[A-Za-z ]/);
filtrerLaSaisie('nomR', /[A-Za-z ]/);
filtrerLaSaisie('prenom', /[A-Za-z ]/);

// génération de l'événement click sur les icônes d'effacement
document.querySelectorAll('.icone-effacer').forEach(icone => {
    icone.addEventListener('click', () => {
        const idChamp = icone.dataset.cible;
        effacerColonne(idChamp);
    });
});