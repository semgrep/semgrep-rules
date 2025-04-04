package samples

import (
	"fmt"
	"io/ioutil"
    "os"
)

func main() {
	// ruleid:bad-tmp-file-creation
	err := ioutil.WriteFile("/tmp/demo2", []byte("This is some data"), 0644)
	if err != nil {
		fmt.Println("Error while writing!")
	}
}
func main_2() {
	// ok:bad-tmp-file-creation -- deprecated, now simply calls os.CreateTemp
	_, err := ioutil.TempFile("/tmp", "my_temp")
	if err != nil {
		fmt.Println("Error while writing!")
	}
}

func main_good() {
	// ok:bad-tmp-file-creation
	_, err := os.CreateTemp("/tmp", "my_temp")
	if err != nil {
		fmt.Println("Error while writing!")
	}
}
