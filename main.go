package main

/*
#cgo CFLAGS: -x objective-c
#cgo LDFLAGS: -framework Cocoa

extern void RunApp(void);
*/
import "C"

func main() {
	C.RunApp()
}
