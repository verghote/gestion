"use strict";

// Version 2025.1
// Date version : 22/07/2025

/* global autoComplete */

export function initAutoComplete({ selector, fetchUrl, searchKey = "nomPrenom", onSelection }) {
    const options = {
        data: {
            src: async (query) => {
                try {
                    const response = await fetch(`${fetchUrl}?search=${encodeURIComponent(query)}`);
                    return await response.json();
                } catch (error) {
                    console.error(fetchUrl, query);
                    console.error("Erreur AJAX", error);
                    return [];
                }
            },
            keys: [searchKey]
        },
        selector: selector,
        threshold: 1,
        resultItem: {
            highlight: true,
        },
        theme: 'round',
        diacritics: true,
        resultsList: {
            noResults: true,
            maxResults: 10,
            element: (list, data) => {
                if (!data.results.length) {
                    const info = document.createElement("p");
                    info.style.padding = "4px 6px";
                    info.style.fontStyle = "italic";
                    info.style.fontSize = "0.8em";
                    info.style.color = "#666";
                    info.textContent = "Aucune correspondance trouvée";
                    list.appendChild(info);
                }
            }
        },
        events: {
            input: {
                selection: (event) => {
                    const selection = event.detail.selection.value;
                    if (typeof onSelection === "function") {
                        onSelection(selection);
                    }
                }
            }
        },
    };

    return new autoComplete(options);
}
