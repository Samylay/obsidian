
## Definition of Done — Story « Retour à la base lorsque la batterie est faible »

**Story** :  
_En tant que superviseur, je veux que le robot retourne automatiquement à sa base lorsque le niveau de batterie est faible afin d’éviter une panne en cours de mission._

---

### Compréhension fonctionnelle

- Les règles de fonctionnement sont clairement définies et validées avec le Product Owner :
    
    - Seuil de batterie déclencheur (ex. 15 %).
        
    - Comportement attendu en cas de batterie fluctuante (hystérésis éventuelle).
        
    - Priorité par rapport à la tâche en cours (arrêt immédiat ou fin de sous-tâche).
        
    - Comportement en cas d’impossibilité de rejoindre la base (réessai, arrêt sécurisé, alerte).
        
- Les critères d’acceptation sont formalisés et validés (Given / When / Then).
    

---

### Codage (dev)

- La fonctionnalité est implémentée conformément aux spécifications.
    
- Le code respecte les standards de qualité et de lisibilité du projet.
    
- Les cas limites sont pris en compte :
    
    - Batterie instable.
        
    - Robot déjà en retour vers la base.
        
    - Perte de communication avec les capteurs ou la navigation.
        

---

### Revue de code par les pairs (macro)

- Le code a fait l’objet d’une revue globale :
    
    - Architecture cohérente.
        
    - Absence de duplication ou de logique dispersée.
        
    - Solution maintenable dans le temps.
        
- Les paramètres critiques (seuil, délais) ne sont pas codés en dur.
    

---

### Inspection du code (micro)

- Vérification détaillée :
    
    - Gestion correcte des erreurs et des retours d’API.
        
    - Pas de conditions non gérées (null, états incohérents, conflits d’événements).
        
    - Présence de logs explicites lors du déclenchement et de l’exécution du retour.
        

---

### Tests unitaires

- Des tests unitaires couvrent la logique métier :
    
    - Batterie passe sous le seuil → déclenchement du retour à la base.
        
    - Batterie au-dessus du seuil → aucun déclenchement.
        
    - Batterie oscillante autour du seuil → pas de déclenchements multiples.
        
    - Robot déjà en retour → aucune action redondante.
        
- Les chemins critiques sont couverts.
    

---

### Tests d’intégration

- Les interactions entre composants sont validées :
    
    - API batterie.
        
    - API de navigation.
        
- Vérification du bon enchaînement des états et des événements.
    

---

### Tests de bout en bout

- Scénario utilisateur validé :
    
    1. Le robot est en mission.
        
    2. Le niveau de batterie atteint le seuil critique.
        
    3. La mission est interrompue selon la règle définie.
        
    4. Le robot retourne à la base.
        
    5. L’état est visible dans l’interface de supervision.
        
- Test réalisé en environnement simulé ou réel.
    

---

### Tests de non-régression

- Vérification que la fonctionnalité n’impacte pas :
    
    - Les missions standards.
        
    - La navigation normale.
        
    - Les fonctions de pause/reprise.
        
    - Les alertes existantes.
        
- Exécution de la suite de tests automatisés existante.
    

---

### Qualité produit

- Les paramètres clés sont configurables.
    
- Les erreurs critiques génèrent une alerte claire côté supervision.
    
- Une documentation succincte décrit le comportement et les méthodes de test.
    
