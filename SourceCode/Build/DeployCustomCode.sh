### Steps to deploy custom code ###

### 1. Copy the repository to windchill folder ###

cp -rf /home/GithubRepo/SourceCode /opt/ptc/Windchill_11.0/Windchill/

### 2. Navigate to windchill shell ###

cd /opt/ptc/Windchill_11.0/Windchill/bin
./windchill shell

### 3. Navigate to the build folder ###

cd /opt/ptc/Windchill_11.0/Windchill/SourceCode/Build

### 4. Execute the ant command ###
ant
