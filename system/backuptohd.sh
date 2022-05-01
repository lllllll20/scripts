#! /usr/bin/bash

rsync -av --exclude 'git' --delete "${HOME}"/computing/*  /run/media/iain/LaCie/computing/
rsync -av --delete "${HOME}"/my_docs/  /run/media/iain/LaCie/my_docs/
rsync -av --delete "${HOME}"/work_docs/  /run/media/iain/LaCie/work_docs/
rsync -av --exclude 'Films' --exclude 'virtual machines' --exclude 'Games' --delete /run/media/iain/samsung/media/*  /run/media/iain/LaCie/media/
rsync -av /run/media/iain/samsung/media/Films/  /run/media/iain/LaCie/media/Films/
rsync -av --delete "${HOME}"/notes/  /run/media/iain/LaCie/notes/
rsync -avL --delete "${HOME}"/scripts/  /run/media/iain/LaCie/scripts/




