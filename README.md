# Gestion des données

Application web PHP de gestion des catégories, des coureurs, des annonces et des projets avec leurs compétences associées. L'interface est en français et s'appuie sur une base MySQL.

## Fonctionnalités

- Consulter, ajouter, modifier et supprimer des catégories.
- Consulter, ajouter et modifier des coureurs et leurs informations de club.
- Consulter et gérer des annonces, avec un éditeur de contenu enrichi.
- Gérer les projets et les compétences qui leur sont associées.
- Appliquer les règles métier et les contraintes d'intégrité au niveau de l'application et de la base de données.

## Prérequis

- PHP 8.1 ou supérieur, avec PDO et le pilote `pdo_mysql`, ainsi que les extensions `mbstring`, `curl` et `iconv`.
- Composer.
- MySQL 8.0.16 ou supérieur (le schéma utilise notamment des contraintes `CHECK`, des déclencheurs et des procédures stockées).
- Apache avec `mod_rewrite` activé et les fichiers `.htaccess` autorisés.

L'ordonnanceur d'événements MySQL est nécessaire uniquement pour activer la suppression quotidienne des annonces arrivées à échéance.

## Installation

1. Installer les dépendances PHP depuis la racine du projet :

   ```bash
   composer install
   ```

2. Créer la base et le compte d'application avec les scripts de `sql\`. Exécuter `sql\create database.sql`, puis `sql\create user.sql` avec un compte MySQL administrateur. Adapter au préalable les identifiants du script de création de compte et ceux de `config\database.php` ; ne pas utiliser d'identifiants de développement en production.

3. Avec un compte MySQL administrateur, exécuter les scripts de structure et, si souhaité, les jeux de données dans cet ordre. Ils se trouvent dans `sql\` :

   1. `Catégorie\create.sql`, puis `Catégorie\insert.sql` et `Catégorie\declencheur.sql`.
   2. `Coureur\create.sql`, `Coureur\procedure.sql`, `Coureur\declencheur.sql`, puis éventuellement `Coureur\insert.sql`.
   3. `Bloc Domaine et compétence\create et insert.sql`, puis `Bloc Domaine et compétence\declencheur.sql`.
   4. `Projet et compétence\create.sql`, puis éventuellement `Projet et compétence\insert.sql` et `Projet et compétence\declencheur.sql`.
   5. `Annonce\create.sql`, puis `Annonce\declencheur.sql`. `Annonce\insert.sql` ajoute des annonces d'exemple ; `Annonce\evenement.sql` configure leur suppression automatique quotidienne.

   Les scripts d'initialisation de la base et de création des tables suppriment les objets existants correspondants. Les scripts de données réinitialisent également les données de certaines tables : ne les exécuter que sur une base dont les données peuvent être remplacées. Le jeu de données des annonces contient des dates déjà échues ; son import doit être fait avec un compte administrateur `root`, comme prévu par le déclencheur, ou être adapté aux dates à venir.

4. Renseigner les paramètres de connexion MySQL dans `config\database.php` (`host`, `database`, `user`, `password` et éventuellement `port`). L'application attend par défaut une base nommée `gestion`.

5. Configurer l'hôte web pour que sa racine documentaire soit le répertoire `public\` du projet. Conserver `bootstrap\` et `public\` au même niveau dans l'arborescence. Autoriser `mod_rewrite` et les règles `.htaccess` de `public\`.

6. Ouvrir l'adresse configurée dans le navigateur. La navigation principale donne accès aux listes de catégories, coureurs, annonces et projets.

Pour la suppression automatique des anciennes annonces, vérifier que `event_scheduler` est activé sur le serveur MySQL et que le compte qui installe l'événement a les privilèges nécessaires. Cette fonction peut être omise si le nettoyage est réalisé autrement.

## Organisation du projet

| Répertoire ou fichier | Rôle |
| --- | --- |
| `bootstrap\bootstrap.php` | Initialise la session, les chemins, l'autoload Composer et la gestion des erreurs. |
| `config\` | Configuration de la base, du menu et des messages associés aux contraintes SQL. |
| `public\` | Racine web : pages, points d'entrée AJAX, scripts, styles et composants front-end. |
| `src\ClasseMetier\` | Modèles métier associés aux données de l'application. |
| `src\ClasseTechnique\` | Accès PDO, génération de pages, formulaires, validation, menus et réponses JSON. |
| `src\Service\` | Opérations métier coordonnées, notamment l'enregistrement transactionnel d'un projet et de ses compétences. |
| `view\` | Templates HTML partagés. |
| `sql\` | Scripts de création, contraintes, déclencheurs, procédures, données d'exemple et requêtes. |
| `maintenance\` | Outils et définition de référence pour vérifier une partie de la structure de la base. |
| `documentation\` | Documents PDF présentant l'activité et les opérations de gestion. |

Les classes PHP sont chargées par Composer selon l'autoload PSR-4 défini dans `composer.json`. Les composants front-end nécessaires (dont Bootstrap et TinyMCE) sont fournis dans `public\composant\`.

## Notes d'exploitation

- Les URL sans extension sont réécrites par Apache vers les pages PHP correspondantes ; les endpoints dans les répertoires `ajax\` attendent l'en-tête `X-Requested-With: XMLHttpRequest`.
- Les règles de validation et les contraintes de base de données sont définies dans les classes métier et les scripts SQL. `config\contrainte.php` fournit les messages affichés pour les principales erreurs d'intégrité.
- Les documents de `documentation\` donnent des informations complémentaires sur l'ajout et la mise à jour des données.
