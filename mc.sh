#!/bin/bash
#This is open source, if you would like, you can make better version of this script
echo "----------------------------------------------------------------------------------------------------------------"
echo "This bash script is open source, created by me(aka pavle). you can go to: https://pavlestefanovic.com/projects/projectmcbash.php and on github page for more info on how to use this program"
echo "openjdk 17,18(command to install it: sudo apt-get install openjdk-17-jre-headless) are REQUIRED for 1.18 > to work!!!!!!"
echo "------------------------------------------------------------------------------------------------------------------------------------------"
#gathering data about the server
echo "What MC Version would you like to install?"
read version
echo "How much RAM to use on server? Specify in MB(1GB=1024MB, do your maths) Put M at the end of the number"
read ram
echo "what openjdk version would you want? openjdk 17 is for 1.18+ versions, openjdk 8 is for 1.8 - 1.17.x"
read openjdk
#checking if user done any input
if [ $version ]; then
	echo "Installing version: $version"
	#getting BuildTools.jar
	echo $(wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar)
	echo "------------------------------------"
	echo "Let this script do its thing now..."
	echo "-----------------------------------"
	#Running BuildTools.jar
	echo $(java -jar BuildTools.jar --rev $version)
	echo "Server is starting soon..."
	echo "when server is started, to stop it press the combination: ctrl+c"
	echo "when server is stopped, to start it again do: ./start.sh"
	#Starting server
	echo $(echo java -Xms$ram"M" -Xmx$ram"M" -jar spigot-$version.jar nogui > start.sh)
	echo $(chmod +x start.sh)
	echo $(java -Xms$ram -Xmx$ram -jar spigot-$version.jar)
	echo $(echo java -Xms$ramM -Xmx$ramM -jar spigot-$version.jar nogui > start.sh)
	echo "-----------------------------------------------------------------------------------------------------------------------------------"
	echo "This should be it! Have fun! To start your server run command: ./start.sh"
else
	echo "No input detected. shutting program down."
fi
