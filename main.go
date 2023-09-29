package main

import (
	"fmt"
	"os"
)

func main() {
	if len(os.Args) != 2 {
		panic("not enough argument")
	}

	hello := fmt.Sprintf("Hello %s!", os.Args[1])

	fmt.Println(hello)
}
