#!/usr/bin/bash


pandoc "$1" -o /tmp/tempfile.pdf --from markdown --template eisvogel --listings && zathura /tmp/tempfile.pdf &

