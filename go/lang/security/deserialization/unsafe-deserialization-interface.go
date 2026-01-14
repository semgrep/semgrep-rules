package main

import (
	"encoding/json"
	"encoding/xml"

	"gopkg.in/yaml.v3"
)

// Vulnerable patterns - should be flagged

func vulnerableJSON(data []byte) {
	// ruleid: go-unsafe-deserialization-interface
	var result interface{}
	json.Unmarshal(data, &result)
}

func vulnerableYAML(data []byte) {
	// ruleid: go-unsafe-deserialization-interface
	var result interface{}
	yaml.Unmarshal(data, &result)
}

func vulnerableXML(data []byte) {
	// ruleid: go-unsafe-deserialization-interface
	var result interface{}
	xml.Unmarshal(data, &result)
}

// Safe patterns - should NOT be flagged

type User struct {
	ID    int    `json:"id"`
	Name  string `json:"name"`
	Email string `json:"email"`
}

func safeJSON(data []byte) {
	// ok: go-unsafe-deserialization-interface
	var user User
	json.Unmarshal(data, &user)
}

func safeYAML(data []byte) {
	// ok: go-unsafe-deserialization-interface
	var user User
	yaml.Unmarshal(data, &user)
}

func safeXML(data []byte) {
	// ok: go-unsafe-deserialization-interface
	var user User
	xml.Unmarshal(data, &user)
}

type Config struct {
	Host string `json:"host"`
	Port int    `json:"port"`
}

func safeConfigJSON(data []byte) {
	// ok: go-unsafe-deserialization-interface
	var config Config
	json.Unmarshal(data, &config)
}

