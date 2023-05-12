package main

import (
	"fmt"
	"net/http"
)

const http_addr = ":8080"

func main() {
	msgHandler := msg("JakaL - Hello from Web Server in Go")
	fmt.Println("My Server is listening..." + http_addr)
	http.ListenAndServe(http_addr, msgHandler)
}

type msg string

func (m msg) ServeHTTP(resp http.ResponseWriter, req *http.Request) {
	fmt.Fprint(resp, m)
}
