package main

import (
	"filepath"
	"path"
)

func a() {
	dir := getDir()

	// ok: use-filepath-join
	var p = path.Join(getDir())
	// ok: use-filepath-join
	var fpath = filepath.Join(getDir())

	// ruleid: use-filepath-join
	path.Join("/", path.Base(p))
}

func a() {
	url, err := url.Parse("http://foo:666/bar")
	if err != nil {
		panic(err)
	}

	// ok: use-filepath-join
	fmt.Println(path.Join(url.Path, "baz"))
}

func a(p string) {
	// ruleid: use-filepath-join
	fmt.Println(path.Join(p, "baz"))

	// ok: use-filepath-join
	fmt.Println(path.Join("asdf", "baz"))

	// ok: use-filepath-join
	fmt.Println(filepath.Join(a.Path, "baz"))
}

