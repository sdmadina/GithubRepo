#!/bin/bash
### Steps to deploy custom code ###

### 1. Copy the repository to windchill folder ###
echo "Start : Copying the repository to windchill folder"
cp -rf /home/GithubRepo/SourceCode /opt/ptc/Windchill_11.0/Windchill/
echo "End : Copying the repository to windchill folder"

### 2. Navigate to windchill shell ###

echo "Start : Navigating to windchill shell"
cd /opt/ptc/Windchill_11.0/Windchill/bin
./windchill shell
echo "End : Navigating to windchill shell"

### 3. command to stop windchill###
echo "Start : Stopping windchill"
./windchill stop
echo "End : Windchill stopped"

### 4. Navigate to the build folder ###
echo "Start : Navigating to the build folder"
cd ../SourceCode/Build
echo "End : Navigating to the build folder"


### 5. Execute the ant command ###
echo "Start : Executing ant command"
WT_HOME=/opt/ptc/Windchill_11.0/Windchill/
JAVA_HOME=/opt/ptc/Windchill_11.0/Java/jre/bin/java
/opt/ptc/Windchill_11.0/Windchill/ant/bin/ant
echo "End : Executing ant command done"

### 6. command to clear the tomcat cache ###
echo "Start : Clear the tomcat cache" 
cd /opt/ptc/Windchill_11.0/Windchill/tomcat/instances
rm -rf *
echo "End : Tomcat cache cleared"

###7. command to clear the infoengine cache###
echo "Start : Clearing the infoengine cache" 
cd /opt/ptc/Windchill_11.0/Windchill/tasks/codebase/com/infoengine/compiledTasks/file
rm -rf *
echo "End : Infoengine cache cleared"

###8. command to start Windchill###
echo "Start : Starting windchill"
cd /opt/ptc/Windchill_11.0/Windchill/bin
./windchill start
echo "End : Windchill started"