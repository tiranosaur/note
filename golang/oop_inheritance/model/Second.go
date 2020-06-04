package model

type Second struct {
	First
	age int
}

func (model *Second) SetAge(age int) {
	model.age = age
}

func (model *Second) GetAge() int {
	return model.age
}
