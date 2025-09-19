package main

import (
	"context"
	"fmt"
)

type App struct {
	ctx context.Context
}

func NewApp() *App {
	return &App{}
}

func (a *App) startup(ctx context.Context) {
	a.ctx = ctx
}

// TOOD - implement
func (a *App) LoadServerConf() string {
	return fmt.Sprintf("LoadServerConf - stub successfully called")
}
