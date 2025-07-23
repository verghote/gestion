<?php
if (!isset($titre)) {
    $titre = ucwords(trim(dirname($_SERVER['PHP_SELF']), '/'));
}
?>
<div class="d-flex justify-content-between align-items-center">
    <!-- Bloc de gauche : liens de navigation -->
    <div>
        <a href="/" style="color:white">🏠 La gestion des données</a>
    </div>
    <!-- Bloc de droite : le titre -->
    <div class="text-end">
        <?= htmlspecialchars($titre) ?>
    </div>
</div>