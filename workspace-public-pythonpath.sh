#!/bin/bash

PUBLIC=$HOME/public

if [ -d $PUBLIC ]; then
    pydir=$(ls -1d $PUBLIC/lib/python* | head -1)
    if [ -d "$pydir" ]; then 
        export PYTHONPATH="${pydir}:${PYTHONPATH}"
    fi
fi
