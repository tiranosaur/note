package model

import "strconv"

type Second struct {
	First
	age int
}

func (model *Second) GetName() string {
	return model.name + " " + strconv.Itoa(model.age)
}

func (model *Second) SetAge(age int) {
	model.age = age
}

func (model *Second) GetAge() int {
	return model.age
}
