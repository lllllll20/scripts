#! /usr/bin/bash

# Delete files from hard drive if they are deleted from desktop

rsync -av --delete --exclude 'git' "${HOME}"/computing/  /run/media/"${USER}"/LaCie/computing/
rsync -av --delete "${HOME}"/my_docs/  /run/media/"${USER}"/LaCie/my_docs/
rsync -av --delete "${HOME}"/work_docs/  /run/media/"${USER}"/LaCie/work_docs/
rsync -av --exclude 'Films' --exclude 'Games' --delete "${HOME}"/media/  /run/media/"${USER}"/LaCie/media/
rsync -av --delete "${HOME}"/notes/  /run/media/"${USER}"/LaCie/notes/
rsync -avL --delete "${HOME}"/scripts/  /run/media/"${USER}"/LaCie/scripts/


# Film and email directory is handled separately so that films are never lost, but can be deleted from desktop

rsync -av "${HOME}"/media/Films/  /run/media/"${USER}"/LaCie/media/Films/ 
rsync -av "${HOME}"/.archivedmail/ /run/media/"${USER}"/LaCie/.archivedmail/

