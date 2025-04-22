#!/bin/bash

source ./bashscripts/lib/custom.sh
# Validate input
if [ $# -ne 2 ]; then
    echo "Usage: $0 <path> <remote_repo>"
    exit 1
fi

LOCAL_PATH="$1"
REMOTE_REPO="$2"
BRANCH="main"  # Default branch

curr_dir=$(pwd)

log "info" "Inizializzazione push per $LOCAL_PATH verso $REMOTE_REPO (branch: $BRANCH)"

cd "$LOCAL_PATH" || handle_error "Impossibile accedere a $LOCAL_PATH"

# Inizializzazione repository locale
log "info" "Inizializzazione repository locale"
git init || handle_git_error "git init" "Impossibile inizializzare il repository"

# Creazione branch
log "info" "Creazione branch $BRANCH"
git checkout -b "$BRANCH" || handle_git_error "git checkout" "Impossibile creare il branch $BRANCH"

# Configurazione remote
log "info" "Configurazione remote origin"
git remote add origin "$REMOTE_REPO" || handle_git_error "git remote add" "Impossibile aggiungere il remote origin"

# Fetch e merge
log "info" "Fetch da remote"
git fetch --all || handle_git_error "git fetch" "Impossibile eseguire fetch"

# Aggiunta e commit dei file
log "info" "Commit dei file locali"
git add -A
git commit -m "Inizializzazione repository" || true  # Non fallire se non ci sono cambiamenti

# Merge con remote
log "info" "Merge con remote"
#git merge origin/"$BRANCH" --allow-unrelated-histories || handle_git_error "git merge" "Impossibile eseguire merge con origin/$BRANCH"
git pull origin "$BRANCH" --autostash 

# Commit finale e push
log "info" "Commit finale e push"
git add -A
git commit -m "Merge con remote" || true  # Non fallire se non ci sono cambiamenti
git push -u origin "$BRANCH" || handle_git_error "git push" "Impossibile eseguire push su origin/$BRANCH"

# Pulizia
log "info" "Pulizia repository locale"
rm -rf .git

# Ritorno alla directory originale
cd "$curr_dir" || handle_error "Impossibile tornare alla directory originale"

log "success" "Push ORG completato con successo"