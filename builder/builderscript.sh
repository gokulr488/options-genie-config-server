#!/bin/bash
rm -rf /home/workspace/code
git clone https://gokulr488:$GITHUB_TOKEN@github.com/gokulr488/options-genie-config-server.git /home/workspace/code
cd /home/workspace/code
ls
mvn clean install -DskipTests
echo "Starting to Copy artifacts"
ls /home/workspace/code/target/
sshpass -p 'unnir7488*' scp -o StrictHostKeyChecking=no /home/workspace/code/target/optionsgenieconfig-0.0.1-SNAPSHOT.jar gokul@10.244.88.51:/home/gokul/optionsgenie/configbuilder/configapp/
echo "Copied"
echo "Starting Docker Image build"
sshpass -p 'unnir7488*' ssh -o StrictHostKeyChecking=no gokul@10.244.88.51 'cd /home/gokul/optionsgenie/configbuilder/configapp/ && ./buildImage.sh'
echo "Finished"