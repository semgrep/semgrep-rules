package main
import (
    "fmt"
)
import foobarbaz "unsafe"

type Fake struct{}
func (Fake) Good() {}
func main() {
    unsafeM := Fake{}
    unsafeM.Good()
    intArray := [...]int{1, 2}
    fmt.Printf("\nintArray: %v\n", intArray)
    intPtr := &intArray[0]
    fmt.Printf("\nintPtr=%p, *intPtr=%d.\n", intPtr, *intPtr)
    addressHolder := uintptr(foobarbaz.Pointer(intPtr)) + unsafe.Sizeof(intArray[0])
    intPtr = (*int)(foobarbaz.Pointer(addressHolder))
    fmt.Printf("\nintPtr=%p, *intPtr=%d.\n\n", intPtr, *intPtr)
}