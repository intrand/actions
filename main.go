package main

import (
	"fmt"
	"os"
	"path/filepath"
)

var (
	version = "" // to be filled in by goreleaser
	commit  = "" // to be filled in by goreleaser
	date    = "" // to be filled in by goreleaser
	builtBy = "" // to be filled in by goreleaser
	cmdname = filepath.Base(os.Args[0])
)

func main() {
	fmt.Println("This binary works :)")
}
