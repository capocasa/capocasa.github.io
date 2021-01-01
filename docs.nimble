
version       = "0.1.0"
author        = "Carlo Capocasa"
description   = "A new awesome nimble package"
license       = "BSD-3-Clause"
srcDir        = "src"

task builddoc, "build docs":
  for lib in ["opus", "nestegg", "dav1d"]:
    exec "~/nim/bin/nim doc ~/nim-$1/$1.nim" % lib
    exec "rsync -av ~/nim-$1/htmldocs/ nim-$1/" % lib

