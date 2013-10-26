APP=Cocoa\ Go
APPDIR=$(APP).app
GOSRC=exported.go main.go

all: $(APP)

.PHONY: $(APP)
$(APP): \
	$(APPDIR)/Contents/MacOS/$(APP) \
	$(APPDIR)/Contents/Resources/Base.lproj/MainMenu.nib \
	$(APPDIR)/Contents/Info.plist \
	$(APPDIR)/Contents/PkgInfo

$(APPDIR)/Contents/MacOS/$(APP): $(GOSRC)
	-mkdir -p "`dirname \"$@\"`"
	CC=clang go build -o "$@"

$(APPDIR)/Contents/Resources/Base.lproj/MainMenu.nib: MainMenu.xib
	-mkdir -p "`dirname \"$@\"`"
	ibtool --compile "$@" MainMenu.xib

$(APPDIR)/Contents/Info.plist: Info.plist
	-mkdir -p "`dirname \"$@\"`"
	sed -e 's/$$[{]APP}'/$(APP)/ Info.plist > "$@"

$(APPDIR)/Contents/PkgInfo: PkgInfo
	-mkdir -p "`dirname \"$@\"`"
	cp PkgInfo "$@"

clean:
	-rm -r $(APPDIR)
