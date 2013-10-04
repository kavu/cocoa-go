cocoa-go
========

A simple PoC example of calling Go from Cocoa and vice versa.

To build please run `CC=clang go build`.

If you want to edit the XIB, you need to recompile it: `rm app.nib && ibtool --compile app.nib app.xib`
