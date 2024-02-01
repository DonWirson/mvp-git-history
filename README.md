#   APP MVP-GIHISTORY! 👨🏽‍💻
## App features:
-   Show all commits from a repository
-   Show all commits from a repository branch (TODO)

##   Prerequisites

#   1.- Flutter version 3.16.8 and dart version: >=3.2.5 <4.0.0
>   Recordar que tiene que estar corriendo el backend para que funcione la app correctamente.

#   2.- Check the .env file, it should look like this:

```
API_URL = https://api.github.com
REPO_NAME = mvp-git-history
REPO_OWNER = DonWirson

BRANCH_ENDPOINT = $API_URL/repos/$REPO_OWNER/$REPO_NAME/branches
COMMIT_ENDPOINT = $API_URL/repos/$REPO_OWNER/$REPO_NAME/commits
```

>   You can swap "REPO_NAME" and "REPO_OWNER for another Public repository name and owner.



#   3.- Use vscode or android studio to open the project root folder

>   Folder structure should look like this:
```
>ios
>lib
>linux
>macos
>test
>web
.env
.gitignore
pubspec.yaml
pubspec.lock
```

##############################################
##  Running the app
#   The easy way: VS Code
#   1.- Open Visual Studio Code


#   2.- Open the root folder of the app
>   Check "prerequisites" if unclear of which folder is the root folder,

#   3.- Select a device to run the flutter app, it should appear on the bottom right corner
>   Check this image if you cant find it https://imgur.com/a/KHZMTgy

#   4.- Click on pubspec.yaml
>   File reference: https://imgur.com/a/TGApYtA


#   5.- After the file is opened look for a Arrow pointing down and click it.

>   It will download the packages required to run the app

>   Visual instructions: https://imgur.com/a/Thu8vrb

#   6.- Open the lib folder and click on a file called main.dart

>   Look for a play button on the top center of your screen

#   The app should run after following the steps.