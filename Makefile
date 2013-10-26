APP=CocoaGo
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
	-mkdir -p $(APPDIR)/Contents/MacOS
	CC=clang go build -o $@

$(APPDIR)/Contents/Resources/Base.lproj/MainMenu.nib: MainMenu.xib
	-mkdir -p `dirname $@`
	-rm $@
	ibtool --compile $@ MainMenu.xib

$(APPDIR)/Contents/Info.plist: Info.plist
	sed -e 's/$$[{]APP}'/$(APP)/ Info.plist > "$@"

$(APPDIR)/Contents/PkgInfo: PkgInfo
	cp PkgInfo $@

clean:
	-rm -r $(APPDIR)
