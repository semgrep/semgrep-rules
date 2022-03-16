package main

import (
	"path"
	"filepath"
)

func main() {
	dir := getDir()

	// ruleid: use-filepath-join
	var path = path.Join(getDir())
	// ok: use-filepath-join
	var fpath = filepath.Join(getDir())
}