package main

/*
extern void SetLabelText(const char *);
*/
import "C"

import (
	"fmt"
	"time"
)

//export go_Test
func go_Test() {
	// Standart Defer
	defer func() {
		fmt.Println("Defer!")
	}()

	// Just print line
	fmt.Println("Go Test!")

	// Goroutine with Window Label updating
	go func() {
		time.Sleep(3 * time.Second)
		C.SetLabelText(C.CString("Woot"))
		fmt.Println("Goroutine!")
	}()
}
