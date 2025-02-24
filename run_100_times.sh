#!/bin/bash

# Compilation du fichier C (si ce n'est pas déjà fait)
make  # si tu utilises un Makefile, sinon gcc ais.c -o ais

# Initialisation des variables
sum=0
count=10

# Exécution du programme 100 fois et récupération de la dernière valeur "Cout final"
for i in {1..10}
do
  # Exécuter le programme et récupérer la dernière ligne contenant "Cout" ou "Cout final"
  value=$(./ais | grep -oP "finalCout:\s*\K[0-9.]+" | tail -n 1)
  
  # Vérifier que value n'est pas vide avant d'additionner
  if [ -n "$value" ]; then
    # Additionner la valeur courante à la somme en utilisant awk
    sum=$(awk -v s="$sum" -v v="$value" 'BEGIN {printf "%.10f", s+v}')
  else
    echo "Aucune valeur récupérée lors de l'exécution $i"
  fi
done

# Calcul de la moyenne avec awk
average=$(awk -v s="$sum" -v c="$count" 'BEGIN {printf "%.2f", s/c}')

# Afficher la moyenne
echo "La moyenne des coûts est: $average"
