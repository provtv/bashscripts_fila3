#!/bin/bash

# Colori per il logging
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}Inizio pulizia dei conflitti di merge...${NC}"

# Funzione per pulire un singolo file
clean_file() {
    local file=$1
    echo -e "${YELLOW}Pulizia di $file${NC}"
    
    # Rimuove i marcatori di conflitto
    sed -i -e '/^<<<<<<< HEAD$/d' \
           -e '/^=======$/d' \
    
    # Rimuove le righe vuote multiple
    sed -i '/^$/N;/^\n$/D' "$file"
    
    echo -e "${GREEN}File $file pulito${NC}"
}

# Trova tutti i file con conflitti
find . -type f -not -path "*/\.*" \
       -not -path "*/vendor/*" \
       -not -path "*/node_modules/*" \
       -exec grep -l "<<<<<<< HEAD" {} \; | while read -r file; do
    clean_file "$file"
done

# Script per risolvere conflitti di merge in file PHP
# Risolve automaticamente i conflitti mantenendo la versione più recente (e4940e9b)

for file in $(grep -l "<<<<<<< HEAD" $(find laravel/Modules/Broker/app/Filament/Clusters/AltriCluster/Resources -type f -name "*.php"))
do
  echo "Fixing conflicts in $file"
  
  # Rimuove le righe di marcatura del conflitto e mantiene la versione "dopo il merge"
  sed -i -e '/^<<<<<<< HEAD$/d' \
         -e '/^=======$/d' \
         -e 's/namespace Modules\\Broker\\Filament\\Resources/namespace Modules\\Broker\\Filament\\Clusters\\AltriCluster\\Resources/' \
         -e 's/use Modules\\Broker\\Filament\\Resources\\/use Modules\\Broker\\Filament\\Clusters\\AltriCluster\\Resources\\/' \
         "$file"
done

echo -e "${GREEN}Tutti i conflitti sono stati risolti!${NC}" 
