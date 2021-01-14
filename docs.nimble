
version       = "0.1.0"
author        = "Carlo Capocasa"
description   = "A new awesome nimble package"
license       = "BSD-3-Clause"
srcDir        = "src"

task docgen, "build docs":
  for name, dir in {
    "opus": "nim-opus",
    "nestegg": "nim-nestegg",
    "dav1d": "nim-dav1d",
    "lov": "lov"
  }.toTable:
    exec "~/nim/bin/nim doc --threads:on ~/$2/$1.nim" % [name, dir]
    exec "rsync -av --delete ~/$1/htmldocs/ $1/" % dir
    let fn = "$2/$1.html" % [name, dir]
    fn.writeFile fn.readFile.replace("wrapper.html", "$1/wrapper.html" % name)
