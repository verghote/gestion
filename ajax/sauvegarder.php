<?php
// 🔐 Sécurisation et robustesse d’un script de sauvegarde Git
date_default_timezone_set('Europe/Paris');

// 📁 1. Aller à la racine du projet
chdir(__DIR__ . '..');

// 🎛️ 2. Demande de confirmation à l'utilisateur
echo "⚠️  Ce script va sauvegarder le dépôt local vers GitHub.\n";
echo "Souhaitez-vous continuer ? (o/n) : ";
$handle = fopen("php://stdin", "r");
$confirmation = strtolower(trim(fgets($handle)));
if ($confirmation !== 'o') {
    echo "❌ Sauvegarde annulée par l'utilisateur.\n";
    exit;
}

// 🔄 3. Récupération de l’état distant (avec contrôle du résultat)
echo "🔍 Vérification de la synchronisation avec la branche distante...\n";
exec('git fetch', $outputFetch, $codeFetch);

if ($codeFetch !== 0) {
    echo "❌ Erreur lors de la récupération de l'état distant (git fetch).\n";
    echo "🔎 Détails :\n" . implode("\n", $outputFetch) . "\n";
    exit(1);
}

// 🔧 4. Analyse du statut local vs distant
exec('git status -sb', $statusOutput);
$etat = $statusOutput[0] ?? '';

if (str_contains($etat, '[behind')) {
    echo "❌ Le dépôt local est en retard sur le dépôt distant.\n";
    echo "💡 Exécutez d’abord : git pull\n";
    exit;
}
if (str_contains($etat, '[ahead')) {
    echo "🔁 Le dépôt local est en avance, on peut pousser les changements.\n";
}
if (str_contains($etat, '[ahead') === false && str_contains($etat, '[behind') === false) {
    echo "✅ Le dépôt est synchronisé.\n";
}

// 🧾 5. Construction du message de commit
$date = date('d/m/Y à H:i');
$commitMessage = "Dernière sauvegarde le $date";

// ➕ 6. Ajouter tous les fichiers
echo "📂 Ajout des fichiers modifiés : git add .\n";
exec('git add .');

// ✅ 7. Commit horodaté
echo "📝 Commit en cours : \"$commitMessage\"\n";
exec("git commit -m \"$commitMessage\"", $commitResult, $commitCode);
if ($commitCode !== 0) {
    echo "ℹ️ Aucun changement à committer.\n";
}

// 🚀 8. Push vers le dépôt GitHub
echo "🚀 Envoi vers le dépôt distant...\n";
exec('git push', $pushOutput, $pushCode);

if ($pushCode === 0) {
    echo "✅ Sauvegarde réussie le $date\n";
} else {
    echo "❌ Erreur lors du push. Vérifiez les conflits ou votre connexion.\n";
    echo "🔎 Détails :\n" . implode("\n", $pushOutput) . "\n";
}
