package main

import (
	"fmt"
	"model"
)

func main() {
	f := new(model.First)
	f.SetName("Tom")
	fmt.Println(f.GetName())

	s:=new(model.Second)
	s.SetName("SSSSS")
	s.SetAge(38)
	fmt.Println()
}
