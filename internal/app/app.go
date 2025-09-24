package app

import (
	"context"
	"fmt"
	"errors"

	"mc-server-config-editor/internal/config"

	"github.com/wailsapp/wails/v2/pkg/runtime"
)

var (
	DirSelectCancelled = errors.New("directory selection cancelled by user")
	DirSelectFailed = errors.New("directory selection failed")
)

type App struct {
	ctx context.Context
	conf config.Config
}

func NewApp() *App {
	return &App{}
}

func (a *App) Startup(ctx context.Context) {
	a.ctx = ctx
	a.conf = nil
}

// TODO
// Temporarily contains string return value, for quick troubleshooting
func (a *App) LoadServerConf() string {
	dirPath, getDirPathErr := a.getServerConfPath()
	if getDirPathErr != nil {
		return fmt.Sprintf("LoadServerConf - could not select directory - %s", getDirPathErr)
	}

	confType := "Java 1.21.5"// TODO - temp, replace with value sent by JS runtime
	conf, loadConfigError := a.LoadConfig(dirPath, confType)
	if loadConfigError != nil {
		return fmt.Sprintf("LoadServerConf - conf directory could not be loaded - %s", loadConfigError)
	}

	a.conf = conf
	return fmt.Sprintf("LoadServerConf - conf directory successfully loaded - %s", conf.Serialise())
}

func (a *App) getServerConfPath() (string, error) {
	dirPath, err := runtime.OpenDirectoryDialog(a.ctx, runtime.OpenDialogOptions{})

	if err != nil { return "", DirSelectFailed }
	if dirPath == "" { return "", DirSelectCancelled }
	return dirPath, nil
}

func (a *App) LoadConfig(dirPath string, confType string) (config.Config, error) {
	conf, err := config.NewConfig(dirPath, confType)
	if err != nil { return nil, err }

	return conf, nil
}
