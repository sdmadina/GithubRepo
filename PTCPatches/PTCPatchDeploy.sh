#!/bin/bash
#######################################################################################
#Steps to install a PTC Temp patch (assuming the temp patch is copied to the windchill
#######################################################################################

###Login to a Windchill shell###

cd /opt/ptc/Windchill_11.0/Windchill/bin
./windchill shell

###command to stop windchill###
cd /opt/ptc/Windchill_11.0/Windchill/bin
./windchill stop

###command to stop HTTPServer###
cd /opt/ptc/Windchill_11.0/HTTPServer/bin
./apachectl -k stop

###Copy the PTC Patch jsr file to <WTHOME> directory ###

cp /home/GithubRepo/PTCPatches/FlexPLM.11.0.0.05.44.jar /opt/ptc/Windchill_11.0/Windchill/

###command to install the patch###
cd /opt/ptc/Windchill_11.0/Windchill
java -jar FlexPLM.11.0.0.05.44.jar --install /opt/ptc/Windchill_11.0/Windchill 

###check for the message 'Build Successful' ###

###command to clear the tomcat cache ###
cd /opt/ptc/Windchill_11.0/Windchill/tomcat/instances
rm -rf *

###command to clear the infoengine cache###
cd /opt/ptc/Windchill_11.0/Windchill/tasks/codebase/com/infoengine/compiledTasks/file
rm -rf *

###command to start HTTPServer###
cd /opt/ptc/Windchill_11.0/HTTPServer/bin
./apachectl -k start

###command to start Windchill###
cd /opt/ptc/Windchill_11.0/Windchill/bin
./windchill start