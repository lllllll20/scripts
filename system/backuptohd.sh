#! /usr/bin/bash

# Delete files from hard drive if they are deleted from desktop

rsync -av --delete --exclude 'git' "${HOME}"/computing/  /run/media/iain/LaCie/computing/
rsync -av --delete "${HOME}"/my_docs/  /run/media/iain/LaCie/my_docs/
rsync -av --delete "${HOME}"/work_docs/  /run/media/iain/LaCie/work_docs/
rsync -av --exclude 'Films' --exclude 'virtual machines' --exclude 'Games' --delete /run/media/iain/samsung/media/  /run/media/iain/LaCie/media/
rsync -av --delete "${HOME}"/notes/  /run/media/iain/LaCie/notes/
rsync -avL --delete "${HOME}"/scripts/  /run/media/iain/LaCie/scripts/


# Film and email directory is handled separately so that films are never lost, but can be deleted from desktop

rsync -av /run/media/iain/samsung/media/Films/  /run/media/iain/LaCie/media/Films/ 
rsync -av "${HOME}"/.archivedmail/ /run/media/iain/LaCie/.archivedmail/

