#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Directory name is missed!!"
else
    if [ -d $1 ]; then
        echo "Directory exists!!"
    else
        mkdir $1
        cd ./$1
        touch README.md
        touch .gitignore
        # Create a new repository on GitHub
        USERNAME="ShadyNabil8"
        ###########################################
        ###########################################
        ############## ADD YOUR TOKEN #############
        ###########################################
        ###########################################
        TOKEN=""
        REPO_NAME=$1
        curl -H "Authorization: token $TOKEN" https://api.github.com/user/repos -d '{"name":"'$REPO_NAME'"}'

        # Extract the SSH URL of the newly created repository
        SSH_URL=$(curl -s -H "Authorization: token $TOKEN" https://api.github.com/repos/$USERNAME/$REPO_NAME | jq -r '.ssh_url')
        echo ${REPO_SSH_URL}
        git init
        git branch -M main
        git remote add origin ${SSH_URL}
        git add .
        git commit -m "Initial commit"
        git push -u origin main
    fi
fi
