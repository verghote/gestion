<?php
// 🔄 restauration sécurisée du dépôt local depuis GitHub

date_default_timezone_set('Europe/Paris');

// 📁 1. Se placer à la racine du projet
chdir(__DIR__ . '/gestion');

// 🎛️ 2. Demande de confirmation utilisateur
echo "⚠️  Ce script va restaurer le dépôt local avec les modifications GitHub.\n";
echo "Souhaitez-vous continuer ? (o/n) : ";
$handle = fopen("php://stdin", "r");
$confirmation = strtolower(trim(fgets($handle)));
if ($confirmation !== 'o') {
    echo "❌ Restauration annulée par l'utilisateur.\n";
    exit;
}

// 🔄 3. Fetch de l’état distant
echo "🔄 Récupération de l’état distant (git fetch)...\n";
exec('git fetch');

// 🔍 4. Analyse de l’état local/distant
exec('git status -sb', $statusOutput);
$etat = $statusOutput[0] ?? '';

echo "📋 Statut actuel : $etat\n";

// ⛔ Cas critique : dépôt local en avance → pull interdit
if (str_contains($etat, '[ahead')) {
    echo "❌ Le dépôt local contient des commits non présents sur GitHub.\n";
    echo "💡 Veuillez d'abord exécuter : git push\n";
    exit;
}

// 💾 Vérification de modifications locales non commités
exec('git status --porcelain', $changes);
if (count($changes) > 0) {
    echo "⚠️  Des fichiers ont été modifiés localement, mais pas commités.\n";
    echo "❗️ Ces modifications seront perdues si un conflit survient pendant la restauration.\n";
    echo "Souhaitez-vous poursuivre malgré tout ? (o/n) : ";
    $confirmation = strtolower(trim(fgets(STDIN)));
    if ($confirmation !== 'o') {
        echo "⛔ Restauration annulée. Vous pouvez faire un commit ou un push manuel si nécessaire.\n";
        exit;
    }
} else {
    echo "✅ Aucun changement local à sauvegarder.\n";
}


// 🔁 6. Pull sécurisé (rebase)
echo "🔁 Synchronisation avec le dépôt GitHub (git pull --rebase)...\n";
exec('git pull --rebase', $pullResult, $pullCode);

$date = date('d/m/Y à H:i');
if ($pullCode === 0) {
    echo "✅ Mise à jour réussie le $date\n";
} else {
    echo "❌ Échec du pull. Conflits possibles ou erreur de connexion.\n";
    echo implode("\n", $pullResult);
}
