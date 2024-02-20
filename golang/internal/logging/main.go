package main

import (
	"console/internal/logging"
	"encoding/json"
)

func main() {
	var m = make(map[string]string)
	m["first"] = "one"
	m["second"] = "two"
	m["third"] = "three"

	jsonStr, _ := json.Marshal(m)

	log.Warning().Printf("hello warning %s", jsonStr)
	log.Info().Printf("hello info %s", jsonStr)
	log.Error().Printf("hello error %s", jsonStr)
}
