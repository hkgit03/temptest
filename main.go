package main

import (
	"fmt"
	"path/filepath"
)

func main() {
	path, err := filepath.EvalSymlinks("/home/laerling/Musik")
	if err != nil {
		fmt.Println("nope")
		return
	}
	fmt.Println(path)
}
