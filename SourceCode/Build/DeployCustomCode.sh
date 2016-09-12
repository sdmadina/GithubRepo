### Steps to deploy custom code ###

### 1. Copy the repository to windchill folder ###

cp -rf /home/GithubRepo/SourceCode /opt/ptc/Windchill_11.0/Windchill/

### 2. Navigate to windchill shell ###

cd /opt/ptc/Windchill_11.0/Windchill/bin
./windchill shell


### 3. command to stop windchill###
cd /opt/ptc/Windchill_11.0/Windchill/bin
./windchill stop


### 4. Navigate to the build folder ###

cd /opt/ptc/Windchill_11.0/Windchill/SourceCode/Build

### 5. Execute the ant command ###
ant

### 6. command to clear the tomcat cache ###
cd /opt/ptc/Windchill_11.0/Windchill/tomcat/instances
rm -rf *

###7. command to clear the infoengine cache###
cd /opt/ptc/Windchill_11.0/Windchill/tasks/codebase/com/infoengine/compiledTasks/file
rm -rf *

###8. command to start Windchill###
cd /opt/ptc/Windchill_11.0/Windchill/bin
./windchill start