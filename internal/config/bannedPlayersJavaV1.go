package config

type bannedPlayersJavaV1 struct {
    uuid      string
    name      string
    created   string // YYYY-MM-DD HH:MM:SS ±0000
    source    string
    expires   string
    reason    string
}
