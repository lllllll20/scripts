#!/usr/bin/bash

if wlrctl window focus "neovim" == true;
then
    setsid -f nvim --server /tmp/nvim.pipe --remote /tmp/scratchpad

else

    setsid -f foot -a neovim nvim --listen /tmp/nvim.pipe /tmp/scratchpad
    
fi
