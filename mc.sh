#!/bin/bash
#This is open source, if you would like, you can make better version of this script
echo "This bash script is open source, created by me(aka pavle). you can go to: https://pavlestefanovic.com and on github page for more info on how to use this program"
echo "openjdk 17,18(command to install it: sudo apt-get install openjdk-17-jre-headless) are REQUIRED for 1.18 > to work!!!!!!"
#gathering data about the server
echo "What MC Version would you like to install?"
read version
echo "How much RAM to use on server? Specify in MB(1GB=1024MB, do your maths) Put M at the end of the number"
read ram
#checking if user done any input
if [ $version ]; then
	echo "Installing version: $version"
	#getting BuildTools.jar
	echo $(wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar)
	echo "Let this script do its thing now..."
	#Running BuildTools.jar
	echo $(java -jar BuildTools.jar --rev $version)
	echo "Server is starting soon..."
	echo "when server is started, to stop it press the combination: ctrl+c"
	#Starting server
	echo $(java -Xms$ram -Xmx$ram -jar spigot-$version.jar)
	echo "This should be it! Have fun! To start your server run command: java -Xms{your ram that you specified before, at the end put M} -Xms{same as for Xmx} -jar spigot-{verson you installer}.jar(eg. spigot-1.18.2.jar)"
else
	echo "No input detected. shutting program down."
fi
