# Hier ist ein einfaches Beispiel für ein Bash-Skript, das ein externes Skript verwendet,
# um mehrere Programme zu installieren. In diesem Beispiel gehen wir davon aus, dass das externe 
# Skript install_packages.sh heißt und die Programme, die installiert werden sollen, als Argumente übergeben werden.

# Last Edit: 26.02.2025

# Hauptskript: install_programs.sh


#!/usr/bin/env bash

# Überprüfen, ob das externe Skript existiert
if [ ! -f "./install_packages.sh" ]; then
    echo "Das Skript install_packages.sh wurde nicht gefunden!"
    exit 1

fi

# Liste der zu installierenden Programme
PROGRAMME=("git" "curl" "vim" "htop")

# Aufruf des externen Skripts mit den Programmen als Argumente
./install_packages.sh "${PROGRAMME[@]}"



# Externes Skript: install_packages.sh

#!/usr/bin/env bash

# Überprüfen, ob mindestens ein Argument übergeben wurde

if [ "$#" -eq 0 ]; then
   echo "Keine Programme zum Installieren angegeben!"
   exit 1

fi


# Installationsbefehl je nach Paketmanager

if command -v apt-get &> /dev/null; then
   # Für Debian-basierte Systeme

    sudo apt-get update
    sudo apt-get install -y "$@"

elif command -v yum &> /dev/null; then
   # Für Red Hat-basierte Systeme
   sudo yum install -y "$@"

else

    echo "Kein unterstützter Paketmanager gefunden!"
    exit 1

fi

echo "Installation abgeschlossen!"


# Verwendung

#   Erstellen Sie die beiden Skripte (install_programs.sh und install_packages.sh) in einem Verzeichnis.
#   Stellen Sie sicher, dass beide Skripte ausführbar sind. Führen Sie dazu den folgenden Befehl aus:

    
# chmod +x install_programs.sh install_packages.sh

# Führen Sie das Hauptskript aus:

#    ./install_programs.sh

# Erklärung

# install_programs.sh: Dieses Skript definiert eine Liste von Programmen, 
#	die installiert werden sollen, und ruft das externe Skript install_packages.sh mit diesen Programmen als Argumente auf.
    
# install_packages.sh: Dieses Skript überprüft, 
#	welcher Paketmanager auf dem System verfügbar ist (entweder apt-get für Debian-basierte Systeme oder yum für Red Hat-basierte Systeme) 
#	und installiert die übergebenen Programme.
