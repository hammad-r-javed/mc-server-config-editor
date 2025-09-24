package config

type bannedIpsJavaV1 struct {
    ip        string
    created   string // YYYY-MM-DD HH:MM:SS ±0000
    source    string
    expires   string
    reason    string
}
