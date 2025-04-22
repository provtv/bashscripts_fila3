#!/bin/bash

# Funzione per pulire un singolo file
clean_file() {
    local file="$1"
    echo "Pulizia file: $file"
    
    # Rimuovi i marcatori di conflitto
    sed -i -e '/^<<<<<<< HEAD$/d' \
           -e '/^=======$/d' \
           "$file"
    
    # Rimuovi righe vuote multiple
    sed -i '/^$/N;/^\n$/D' "$file"
    
    echo "✅ File pulito: $file"
}

# Trova tutti i file con conflitti
echo "Ricerca file con conflitti di merge..."
files_with_conflicts=$(find . -type f -not -path "*/\.*" \
    -not -path "*/vendor/*" \
    -not -path "*/node_modules/*" \
    -exec grep -l "<<<<<<< HEAD" {} \;)

# Pulisci ogni file
for file in $files_with_conflicts; do
    clean_file "$file"
done

echo "✅ Pulizia completata"
