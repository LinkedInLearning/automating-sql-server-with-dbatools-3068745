# Automating SQL Server with dbatools

This is the repository for the LinkedIn Learning course Automating SQL Server with dbatools. The full course is available from [LinkedIn Learning][lil-course-url].

## Instructions

This repository has branches for each of the videos in the course. You can use the branch pop up menu in github to switch to a specific branch and take a look at the course at that stage, or you can add `/tree/BRANCH_NAME` to the URL to go to the branch you want to access.

## Branches

The branches are structured to correspond to the videos in the course. The naming convention is `CHAPTER#_MOVIE#`. As an example, the branch named `02_03` corresponds to the second chapter and the third video in that chapter.

The `main` branch holds the final state of the code when in the course.

When switching from one exercise files branch to the next after making changes to the files, you may get a message like this:

    error: Your local changes to the following files would be overwritten by checkout:        [files]
    Please commit your changes or stash them before you switch branches.
    Aborting

To resolve this issue:

    Add changes to git using this command: git add .
	Commit changes using this command: git commit -m "some message"

## Installing

1. To use these exercise files, you must have the following installed:
   - [Docker](https://www.docker.com/get-started)
   - [git](https://git-scm.com/downloads)
   - [VSCode](https://code.visualstudio.com/download)
   - [`Remote Development` Extension for VSCode](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)

1. Clone this repository into your local machine using the terminal (Mac), PowerShell (Windows), or a GUI tool like SourceTree.

    ```PowerShell
    # change directory to where you'd like the repo to go
    cd C:\GitHub\

    # clone the repo from GitHub
    git clone https://github.com/SQLDBAWithABeard/Bitsdbatools

    # move into the folder
    cd .\Bitsdbatools\

    # open VSCode
    code .
    ```

1. Once VSCode opens, there should be a toast in the bottom right that suggests you 'ReOpen in Container'.
1. The first time that you do this it may take a little time, and you'll need an internet connection, as it'll download the container images used in the demos.
1. Open a pwsh console and start your adventure... (Note it is better in a vanilla pwsh session than in the Integrated Terminal!)

## Rebuild

The beauty of using a dev container for this demo environment is we can quickly destroy the containers and rebuild a brand new environment - no need to worry while you are practicing about accidentally breaking anything!

The only way to fully rebuild though is to ensure that all volumes etc are removed as well.

In a seperate PowerShell console:

```PowerShell
cd .devcontainer
docker-compose -f "docker-compose.yml" -p "automating-sql-server-with-dbatools-3068745_devcontainer" down
```
