package log

import (
	"log"
	"os"
)

var info *log.Logger = nil
var warning *log.Logger = nil
var error *log.Logger = nil

func Info() *log.Logger {
	if info == nil {
		info = log.New(os.Stdout, "INFO: ", log.Ldate|log.Ltime|log.Lshortfile)
	}
	return info
}
func Warning() *log.Logger {
	if warning == nil {
		warning = log.New(os.Stdout, "WARNING: ", log.Ldate|log.Ltime|log.Lshortfile)
	}
	return warning
}
func Error() *log.Logger {
	if error == nil {
		error = log.New(os.Stdout, "ERROR: ", log.Ldate|log.Ltime|log.Lshortfile)
	}
	return error
}
