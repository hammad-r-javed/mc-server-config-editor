package config

import (
    "errors"
)

type configJavaV1 struct {
    rootPath            string
    serverProperties    serverPropertiesJavaV1
    ops                 []opsJavaV1
    whitelist           []whitelistJavaV1
    bannedIps           []bannedIpsJavaV1
    bannedPlayers       []bannedPlayersJavaV1
}

func (c *configJavaV1) setRootPath(rootPath string) {
    c.rootPath = rootPath
}

func (c *configJavaV1) Serialise() string {
    // TODO - implement
    return "{}"
}

func (c *configJavaV1) loadConfigFiles() error {
    // TODO - implement
    return errors.New("Unable to load server.properties. Method not implemented")
}
