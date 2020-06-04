package model

type First struct {
	name string
}

func (a *First) SetName(name string) {
	 a.name = name
}

func (a *First) GetName() string {
	return a.name
}
