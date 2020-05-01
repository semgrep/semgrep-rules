package samples

import (
	"fmt"
	"io/ioutil"
)

func main() {
	//ruleid: incorrect-default-permission
	err := ioutil.WriteFile("/tmp/demo2", []byte("This is some data"), 0644)
	if err != nil {
		fmt.Println("Error while writing!")
	}
}
