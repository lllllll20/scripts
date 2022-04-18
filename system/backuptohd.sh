#! /usr/bin/bash

rsync -av --delete "${HOME}"/computing/  /run/media/"${USER}"/LaCie/computing/
rsync -av --delete "${HOME}"/my_docs/  /run/media/"${USER}"/LaCie/my_docs/
rsync -av --delete "${HOME}"/work_docs/  /run/media/"${USER}"/LaCie/work_docs/
rsync -av --exclude 'Films' --exclude 'virtual machines' --exclude 'Games' --delete /run/media/"${USER}"/samsung/media/*  /run/media/"{USER}"/LaCie/media/
rsync -av /run/media/"${USER}"/samsung/media/Films/  /run/media/"{USER}"/LaCie/media/Films/
rsync -av --delete "${HOME}"/notes/  /run/media/"${USER}"/LaCie/notes/
rsync -av --delete "${HOME}"/scripts/  /run/media/"${USER}"/LaCie/scripts/




