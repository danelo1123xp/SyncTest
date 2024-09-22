#!/bin/bash

# Ścieżka do katalogu z projektem Git
REPO_DIR="$(pwd)" # Używa bieżącego katalogu

# Przejdź do katalogu repozytorium
cd "$REPO_DIR" || exit

while true; do
  # Sprawdź status repozytorium i wykonaj git pull
  echo "Checking for updates..."
  git fetch origin

  LOCAL=$(git rev-parse @)
  REMOTE=$(git rev-parse @{u})

  if [ "$LOCAL" != "$REMOTE" ]; then
    echo "New changes detected. Pulling updates..."
    git pull origin main

    if [ $? -eq 0 ]; then
      echo "Successfully updated the repository."
    else
      echo "Failed to update the repository."
    fi
  else
    echo "No new changes."
  fi

  # Czekaj 5 minut (300 sekund)
  sleep 30
done
