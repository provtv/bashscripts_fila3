#!/bin/bash

# Script per risolvere automaticamente i conflitti di merge nei file bash
# Seguendo il principio DRY (Don't Repeat Yourself)
#
# PERCHÉ: I conflitti di merge non risolti causano errori gravi e duplicazione di funzioni
# COSA: Questo script identifica e risolve automaticamente i conflitti di merge nei file

source ./bashscripts/lib/custom.sh

# Verifica se è stato fornito un percorso
if [ $# -eq 0 ]; then
    log "info" "Nessun percorso specificato, utilizzo la directory corrente"
    TARGET_DIR="."
else
    TARGET_DIR="$1"
    log "info" "Analisi dei conflitti in: $TARGET_DIR"
fi

# Funzione per contare le linee di codice in un blocco
count_lines() {
    echo "$1" | wc -l
}

# Funzione per scegliere il blocco più completo
choose_best_block() {
    local head_block="$1"
    local incoming_block="$2"
    
    local head_lines=$(count_lines "$head_block")
    local incoming_lines=$(count_lines "$incoming_block")
    
    # Scegli il blocco con più linee (presumibilmente più completo)
    if [ "$head_lines" -gt "$incoming_lines" ]; then
        echo "$head_block"
        log "info" "Scelto blocco HEAD ($head_lines linee vs $incoming_lines)"
    else
        echo "$incoming_block"
        log "info" "Scelto blocco incoming ($incoming_lines linee vs $head_lines)"
    fi
}

# Trova tutti i file con conflitti di merge
log "info" "Ricerca file con conflitti di merge..."
FILES_WITH_CONFLICTS=$(grep -l "<<<<<<< HEAD" $(find "$TARGET_DIR" -type f -not -path "*/\.git/*" -not -path "*/node_modules/*") 2>/dev/null)

if [ -z "$FILES_WITH_CONFLICTS" ]; then
    log "success" "Nessun conflitto di merge trovato!"
    exit 0
fi

# Conta i file con conflitti
NUM_FILES=$(echo "$FILES_WITH_CONFLICTS" | wc -l)
log "warning" "Trovati $NUM_FILES file con conflitti di merge"

# Processa ogni file con conflitti
for file in $FILES_WITH_CONFLICTS; do
    log "info" "Elaborazione: $file"
    
    # Crea un file temporaneo
    temp_file="${file}.resolved"
    
    # Stato iniziale per il parsing
    in_conflict=false
    head_block=""
    incoming_block=""
    
    # Leggi il file riga per riga
    while IFS= read -r line; do
        if [[ "$line" == "<<<<<<< HEAD" ]]; then
            # Inizio di un blocco di conflitto
            in_conflict=true
            head_block=""
            incoming_block=""
            continue
        elif [[ "$line" == "=======" ]] && $in_conflict; then
            # Separatore tra HEAD e incoming
            continue
            # Fine del blocco di conflitto
            if $in_conflict; then
                # Scegli il blocco migliore e scrivilo nel file temporaneo
                best_block=$(choose_best_block "$head_block" "$incoming_block")
                echo "$best_block" >> "$temp_file"
                in_conflict=false
            fi
            continue
        elif $in_conflict; then
            # Dentro un blocco di conflitto
            if [[ -z "$incoming_block" ]]; then
                # Siamo ancora nel blocco HEAD
                head_block="${head_block}${line}
"
            else
                # Siamo nel blocco incoming
                incoming_block="${incoming_block}${line}
"
            fi
        else
            # Linea normale, copiala nel file temporaneo
            echo "$line" >> "$temp_file"
        fi
    done < "$file"
    
    # Sostituisci il file originale con quello risolto
    mv "$temp_file" "$file"
    log "success" "Conflitti risolti in: $file"
done

log "success" "Tutti i conflitti sono stati risolti seguendo il principio DRY"
log "info" "Verifica manualmente i file modificati per confermare che le risoluzioni siano corrette"
