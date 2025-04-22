#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

file="$1"

if [ ! -f "$file" ]; then
    echo "File non trovato: $file"
    exit 1
fi

echo "Pulizia file: $file"

# Rimuovi i marcatori di conflitto
sed -i -e '/^<<<<<<< HEAD$/d' \
       -e '/^=======$/d' \
       "$file"

# Rimuovi righe vuote multiple
sed -i '/^$/N;/^\n$/D' "$file"

