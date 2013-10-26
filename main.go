package main

/*
#cgo CFLAGS: -x objective-c
#cgo LDFLAGS: -framework Cocoa

extern int NSApplicationMain(int, const char *[]);
*/
import "C"

func main() {
	C.NSApplicationMain(0, nil)
}
