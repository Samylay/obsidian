# Rapport — Atelier Node.js vs Spring Boot

**Cours** : APPING2 — Node.js  
**Date** : 23 avril 2026  
**Objectif** : Comparer les performances de Node.js et Spring Boot sous charge de 1000 utilisateurs simultanés via k6, et comprendre les modèles de concurrence sous-jacents.

---

## 1. Contexte théorique

### Le problème des threads classiques

Dans un serveur web traditionnel (ex. Spring Boot par défaut), chaque requête HTTP est traitée par un **thread dédié**. Quand ce thread effectue une opération I/O (requête base de données, appel réseau), il **se bloque et attend** — il ne fait rien mais occupe quand même de la mémoire et un slot dans le pool.

Tomcat (le serveur embarqué de Spring Boot) dispose par défaut d'un pool de **200 threads maximum**. Au-delà de 200 requêtes simultanées, les nouvelles requêtes font la queue, la latence explose, et les timeouts s'accumulent.

### La boucle d'événements (Node.js)


Node.js fonctionne sur un modèle radicalement différent : **un seul thread**, piloté par une **boucle d'événements** (via libuv). Quand une opération I/O est lancée, Node.js ne bloque pas — il enregistre un callback et continue à traiter d'autres requêtes. Quand l'I/O se termine, le callback est exécuté.

Résultat : un seul thread peut gérer des milliers de connexions simultanées sans jamais bloquer.

### Les threads virtuels (Java 21 — Project Loom)

Java 21 introduit les **threads virtuels** : des threads légers gérés par la JVM, pas par l'OS. Quand un thread virtuel se bloque sur de l'I/O, la JVM le **parke** (le met en pause) et libère le thread OS sous-jacent pour d'autres tâches. On peut avoir des millions de threads virtuels avec très peu de threads OS.

L'avantage : on garde le style de code bloquant (plus simple à lire), mais on obtient les performances du modèle asynchrone. Un seul paramètre dans Spring Boot active Project Loom.

---

## 2. Environnement de test

| Composant | Version |
|-----------|---------|
| Node.js | v24.11.1 |
| Java | OpenJDK 21.0.10 |
| Spring Boot | 3.x |
| k6 | 1.7.1 |
| MongoDB | Docker |
| Outil de monitoring | Grafana + Prometheus |

**Scénario k6** : rampe progressive jusqu'à 1000 VUs sur 4 minutes (5 étapes), puis descente.

---

## 3. Résultats — Node.js

![[Pasted image 20260423155326.png]]

### Métriques en temps réel (Grafana)

![[Pasted image 20260423160555.png]]

### Résultats finaux k6

| Métrique | Valeur |
|----------|--------|
| Request Rate | ~1 547 req/s |
| p99 Latency | 1.06s |
| Error Rate | **0%** |
| Total Requests | 371 471 |
| Event Loop Lag p99 | 23.7ms |
| Heap Used | ~90 MB |
| VUs max | 1 000 |

### Observations

- **Zéro erreur** sur 371 471 requêtes malgré 1000 utilisateurs simultanés.
- Le p99 dépasse légèrement le seuil de 500ms fixé par le test (1.06s) mais aucune requête n'échoue — le serveur ralentit gracieusement sans tomber.
- L'event loop lag reste sous 25ms même au pic — le thread unique n'est jamais saturé.
- Consommation mémoire très faible (~90MB) grâce au modèle mono-thread.

---

## 4. Résultats — Spring Boot Mode 1 (threads OS classiques)

*(à compléter après le test)*

| Métrique | Valeur |
|----------|--------|
| Error Rate | |
| p99 Latency | |
| Total Requests | |
| Observations | |

### Observations attendues

- Dégradation significative au-delà de ~200 VUs (limite du pool Tomcat).
- Erreurs 503 / timeouts quand toutes les 200 connexions sont occupées.
- Latence qui explose à mesure que la queue s'allonge.

---

## 5. Résultats — Spring Boot Mode 2 (Virtual Threads / Project Loom)

*(à compléter après le test)*

| Métrique | Valeur |
|----------|--------|
| Error Rate | |
| p99 Latency | |
| Total Requests | |

### Observations attendues

- Performances proches de Node.js malgré le même code bloquant.
- Pas de saturation du pool — les threads virtuels parkent sur I/O.

---

## 6. Comparaison et conclusion

| Mode | Modèle | p99 Latency | Error Rate | Pourquoi |
|------|--------|-------------|------------|---------|
| Node.js | Event loop (1 thread) | ~1s | 0% | Jamais bloquant, I/O async |
| Spring Boot — Threads OS | Thread par requête (200 max) | — | — | Pool sature à 200 VUs |
| Spring Boot — Virtual Threads | Threads virtuels (illimités) | — | — | Parke sur I/O, libère l'OS thread |

### Conclusion

Le goulot d'étranglement du Spring Boot classique n'est pas Java — c'est le **modèle thread-par-requête**. Node.js contourne ce problème nativement avec la boucle d'événements. Java 21 propose une troisième voie avec Project Loom : garder un code bloquant lisible tout en atteignant les mêmes performances, sans réécrire l'application en programmation réactive.
