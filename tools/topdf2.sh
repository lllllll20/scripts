#!/usr/bin/bash


pandoc "$1" -o /tmp/tempfile.pdf && zathura /tmp/tempfile.pdf &

