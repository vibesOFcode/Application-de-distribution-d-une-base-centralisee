# BDR - Base de Données Répartie

## Description

Ce projet implémente une architecture de **base de données répartie Oracle** avec réplication et distribution de données entre deux serveurs (ensias1 et ensias2). Il démontre les principaux concepts et techniques d'une infrastructure distribuée en environnement Oracle, incluant la fragmentation horizontale des données, la gestion des liens inter-serveurs et la synchronisation via triggers.

## Architecture

L'architecture se compose de deux nœuds distribués :

- **Serveur 1 ** : Données primaires pour Casablanca
- **Serveur 2 ** : Données primaires pour Rabat + données de référence

Les données sont fragmentées par localité géographique pour optimiser les performances et localiser les traitements.

