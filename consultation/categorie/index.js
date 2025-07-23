"use strict";

// -----------------------------------------------------------------------------------
// Déclaration des variables globales
// -----------------------------------------------------------------------------------

/*global lesCategories, html2pdf */
const lesLignes = document.getElementById('lesLignes');
const btnPdf = document.getElementById('btnPdf');

// -----------------------------------------------------------------------------------
// procédures évènementielles
// -----------------------------------------------------------------------------------
btnPdf.addEventListener("click", () => {
    const element = document.getElementById("pdfContent");

    const opt = {
        margin:       0.5,
        filename:     'categories.pdf',
        image:        { type: 'jpeg', quality: 0.98 },
        html2canvas:  { scale: 2 },
        jsPDF:        { unit: 'in', format: 'a4', orientation: 'portrait' }
    };

    html2pdf().set(opt).from(element).save();
});


// -----------------------------------------------------------------------------------
// Programme principal
// -----------------------------------------------------------------------------------

// affichage de la liste des catégories
for (const categorie of lesCategories) {
    const tr = lesLignes.insertRow();
    tr.style.verticalAlign = 'middle';

    // Colonne : Catégorie
    tr.insertCell().innerText = categorie.nom;

    // Colonne : Code
    tr.insertCell().innerText =  categorie.id;

    // Colonne : Âge entre (centré)
    let td = tr.insertCell();
    td.innerText = categorie.age;
    td.style.textAlign = 'center';

    // Colonne : Né(e) entre (centré)
    td = tr.insertCell();
    td.innerText = categorie.annee;
    td.style.textAlign = 'center';
    td.classList.add('masquer');
}



