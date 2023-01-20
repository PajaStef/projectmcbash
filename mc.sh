#!/bin/bash

# Check if user has necessary permissions to run the script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root. Please run the script again with root privileges." 
   exit 1
fi

# Check if user has java and openjdk installed
java -version >/dev/null 2>&1 || { echo >&2 "Java is required to run this script. Please install Java and try again."; exit 1; }

echo "----------------------------------------------------------------------------------------------------------------"
echo "openjdk 17,18(command to install it: sudo apt-get install openjdk-17-jre-headless) are REQUIRED for 1.18 > to work!!!!!!"
echo "------------------------------------------------------------------------------------------------------------------------------------------"

# Gathering data about the server
echo "What MC Version would you like to install? (e.g. 1.19.2)"
read version

echo "How much RAM to use on server? Specify in MB(1GB=1024MB, do your maths)"
read ram

# Validate user input for RAM
if [[ ! $ram =~ ^[0-9]+$ ]]; then
    echo "Invalid input for RAM. Please enter a valid number."
    exit 1
fi

echo "Installing version: $version"

# Getting BuildTools.jar
echo "Downloading BuildTools.jar..."
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar || { echo >&2 "Error downloading BuildTools.jar. Exiting script."; exit 1; }

echo "------------------------------------"
echo "Let this script do its thing now..."
echo "-----------------------------------"

# Running BuildTools.jar
echo "Building server..."
java -jar BuildTools.jar --rev $version || { echo >&2 "Error building server. Exiting script."; exit 1; }

echo "when server is started, to stop it press the combination: ctrl+c"
echo "when server is stopped, to start it again do: ./start.sh"

# Starting server
echo "Creating start script..."
echo "java -Xms$ram"M" -Xmx$ram"M" -jar spigot-$version.jar nogui" > start.sh
chmod +x start.sh

echo "-----------------------------------------------------------------------------------------------------------------------------------"
echo "This should be it! Have fun! To start your server run command: ./start.sh"
