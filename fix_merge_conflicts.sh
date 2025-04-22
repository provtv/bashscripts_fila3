#!/bin/bash

# Includi le librerie necessarie
source ./bashscripts/lib/custom.sh
source ./bashscripts/lib/logging.sh

# Funzione per pulire un singolo file
clean_file() {
    local file="$1"
    log "Pulizia file: $file"
    
    # Rimuovi i marcatori di conflitto
    sed -i -e '/^$/d' \
           -e '/^$/d' \
           -e '/^>>>>>>> .*$/d' \
           "$file"
    
    # Rimuovi righe vuote multiple
    sed -i '/^$/N;/^\n$/D' "$file"
    
    log "✅ File pulito: $file"
}

# Trova tutti i file con conflitti
log "Ricerca file con conflitti di merge..."
files_with_conflicts=$(find . -type f -not -path "*/\.*" \
    -not -path "*/vendor/*" \
    -not -path "*/node_modules/*" \
    -exec grep -l "" {} \;)

# Pulisci ogni file
for file in $files_with_conflicts; do
    clean_file "$file"
done

log "✅ Pulizia completata"
log "File puliti: $(echo "$files_with_conflicts" | wc -l)" 