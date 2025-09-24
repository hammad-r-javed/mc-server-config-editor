package config

import (
	"fmt"
	"errors"
)

var (
	InvalidConfigType = errors.New("Unable to load config")

    configTypeMap = map[string]Config{
        "Java 1.21.5":  &configJavaV1{rootPath: ""},
    }
)

type Config interface {
    setRootPath(rootPath string)
    loadConfigFiles() error

    Serialise() string
}

func NewConfig(dirPath string, confType string) (Config, error) {
    confObj, exists := configTypeMap[confType]
    if !exists {
        return nil, InvalidConfigType
    }

    confObj.setRootPath(dirPath)

    err := confObj.loadConfigFiles()
    if err != nil { return nil, fmt.Errorf("Unable to load Config files - %w", err) }

    return confObj, nil
}
