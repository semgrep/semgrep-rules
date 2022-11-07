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

func main() {
	url, err := url.Parse("http://foo:666/bar")
	if err != nil {
		panic(err)
	}

	// ok: use-filepath-join
	fmt.Println(path.Join(url.Path, "baz"))
}

func main(a *http.Request) {
	p, err := path.Parse("/opt/foo/bar")
	if err != nil {
		panic(err)
	}

	// ruleid: use-filepath-join
	fmt.Println(path.Join(p.Path, "baz"))

	// ok: use-filepath-join
	fmt.Println(path.Join(a.Path, "baz"))
}
