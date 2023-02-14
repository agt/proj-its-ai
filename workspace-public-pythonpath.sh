#!/bin/bash

PUBLIC=$HOME/public
DPD=$PUBLIC/etc/datahub-profile.d

if [ -d $DPD ]; then
    for i in $DPD/*.sh ; do
        if [ -r "$i" ]; then
            # check bash shell options ("$-") for a lower case "i" = interactive
            if [ "${-#*i}" != "$-" ]; then
                . "$i"
            else
                . "$i" >/dev/null
            fi
        fi
    done
fi
