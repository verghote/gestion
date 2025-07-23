<?php
date_default_timezone_set('Europe/Paris');

// Aller à la racine du projet
chdir(__DIR__ . '..');

echo "Sauvegarde du dépôt local vers GitHub en cours...\n";

// Récupération de l’état distant (avec contrôle du résultat)
echo "Vérification de la synchronisation avec la branche distante : git fetch\n";
exec('git fetch', $outputFetch, $codeFetch);

if ($codeFetch !== 0) {
    echo "Erreur lors de la récupération de l'état distant (git fetch).\n";
    echo "Détails :\n" . implode("\n", $outputFetch) . "\n";
    exit(1);
}

// Analyse du statut local vs distant
echo "Analyse du statut local vs distant : git status -sb\n";
exec('git status -sb', $statusOutput, $statusCode);

if ($statusCode !== 0 || empty($statusOutput)) {
    echo "Erreur lors de l’analyse du statut du dépôt.\n";
    echo "Détails :\n" . implode("\n", $statusOutput) . "\n";
    exit(1);
}

$etat = $statusOutput[0];

if (str_contains($etat, '[behind')) {
    echo "Le dépôt local est en retard sur le dépôt distant.\n";
    echo "Exécutez d’abord : git pull\n";
    exit;
} elseif (str_contains($etat, '[ahead')) {
    echo "Le dépôt local est en avance, les changements peuvent être poussés.\n";
} else {
    echo "Le dépôt est actuellement synchronisé avec le dépôt distant.\n";
}

// Construction du message de commito
$date = date('d/m/Y à H:i');
$commitMessage = "Dernière sauvegarde le $date";

// Ajouter tous les fichiers
echo "Ajout des fichiers modifiés : git add .\n";
exec('git add .');

// Commit horodaté
echo "Commit en cours : git commit - m \"$commitMessage\"\n";
exec("git commit -m \"$commitMessage\"", $commitResult, $commitCode);
if ($commitCode !== 0) {
    echo "Aucun commit créé car aucune modification n’est détectée.\n";
    echo "Il n'y a donc aucun changement à committer, la sauvegarde n'est pas nécessaire.\n";
    exit(0);
}

// Push vers le dépôt GitHub
echo "Envoi vers le dépôt distant : git push \n";
exec('git push', $pushOutput, $pushCode);

if ($pushCode === 0) {
    echo "✅ Sauvegarde réussie le $date\n";
} else {
    echo "Erreur lors du push. Vérifiez les conflits ou votre connexion.\n";
    echo "Détails :\n" . implode("\n", $pushOutput) . "\n";
}
