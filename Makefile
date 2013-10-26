APP=Cocoa\ Go
APPDIR=bin/$(APP).app
GOSRC=src/header.h src/c_funcs.c src/do_button.c src/exported.go src/main.go
CC=clang

all: $(APP)

.PHONY: $(APP)
$(APP): \
	$(APPDIR)/Contents/MacOS/$(APP) \
	$(APPDIR)/Contents/Resources/Base.lproj/MainMenu.nib \
	$(APPDIR)/Contents/Resources/gopher.icns \
	$(APPDIR)/Contents/Info.plist \
	$(APPDIR)/Contents/PkgInfo

$(APPDIR)/Contents/MacOS/$(APP): $(GOSRC) src/
	-mkdir -p "`dirname \"$@\"`"
	cd src/ && CC=$(CC) go build -o "$(CURDIR)/$@"

$(APPDIR)/Contents/Resources/Base.lproj/MainMenu.nib: res/MainMenu.xib
	-mkdir -p "`dirname \"$@\"`"
	ibtool --compile "$@" $<

$(APPDIR)/Contents/Resources/gopher.icns: res/gopher.png
		sips -z 512 512 -s format icns $< --out "$@"

$(APPDIR)/Contents/Info.plist: res/Info.plist.json
	-mkdir -p "`dirname \"$@\"`"
	sed -e 's/$$[{]APP}'/$(APP)/ $< > "$@"
	plutil -convert xml1 "$@"

$(APPDIR)/Contents/PkgInfo: res/PkgInfo
	-mkdir -p "`dirname \"$@\"`"
	cp $< "$@"

clean:
	-rm -r $(APPDIR)
