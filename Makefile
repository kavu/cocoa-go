APP=app

all: cocoa-go $(APP).nib

cocoa-go: exported.go main.go
	CC=clang go build

$(APP).nib: $(APP).xib
	-rm $(APP).nib
	ibtool --compile $(APP).nib $(APP).xib

clean:
	-rm cocoa-app $(APP).nib
