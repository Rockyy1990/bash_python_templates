#!/usr/bin/env bash

# Last Edit: 26.02.2025

# Beispiel Skript zum installieren von mehreren Datein aus einer externen txt datei.
# Das Skript erwartet, dass sich die Datei pakete.txt im gleichen Verzeichnis befindet, 
# in dem das Skript ausgeführt wird. Das bedeutet, dass du entweder in das Verzeichnis navigieren musst, 
# in dem sich das Skript befindet, oder den vollständigen Pfad zur Datei pakete.txt angeben musst.

# if [ ! -f "/pfad/zur/deiner/pakete.txt" ]; then
#    echo "Die Datei pakete.txt wurde nicht gefunden!"
#    exit 1
# fi

# Überprüfen, ob die Datei existiert
if [ ! -f "pakete.txt" ]; then
    echo "Die Datei pakete.txt wurde nicht gefunden!"
    exit 1
fi

# Pakete aus der Datei installieren
while IFS= read -r paket; do
    if [ -n "$paket" ]; then  # Überprüfen, ob die Zeile nicht leer ist
        echo "Installiere Paket: $paket"
        sudo apt-get install -y "$paket"  # Für Debian/Ubuntu-basierte Systeme
        # Für Red Hat-basierte Systeme könnte es so aussehen:
        # sudo yum install -y "$paket"
    fi
done < "pakete.txt"

echo "Installation abgeschlossen."