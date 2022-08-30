#! /usr/bin/bash

setsid -f tsp curl -LO "$1" >/dev/null 2>&1 
