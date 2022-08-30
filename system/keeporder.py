#! /usr/bin/env python

import os
import sys
from pathlib import Path

target = Path(sys.argv[1])
if target.is_file():
    dir = target.parent
    name = target.name
    
    filelist = os.listdir(dir)
    sortedlist = sorted(filelist, key=lambda x: x.lower())
    print(sortedlist)
    loc = sortedlist.index(name)
    number = len(sortedlist)
    first = sortedlist[loc:number]
    second = sortedlist[0:loc]
    orderedlist = first + second

    for file in orderedlist:
        ext = ("JPG", "JPEG", "jpg", "jpeg", "png", "gif", "webp", "tif", "ico")
        if file.endswith(ext):
            print(dir / file)
