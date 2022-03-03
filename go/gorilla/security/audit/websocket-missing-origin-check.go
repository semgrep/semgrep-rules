package main

import (
	"log"
	"net/http"

	"github.com/gorilla/websocket"
)

var upgrader = websocket.Upgrader{
	CheckOrigin: func(r *http.Request) bool {
		return true
	},
	ReadBufferSize:  1024,
	WriteBufferSize: 1024,
}

var upgrader2 = websocket.Upgrader{
	ReadBufferSize:  1024,
	WriteBufferSize: 1024,
}

func handler_check_origin(w http.ResponseWriter, r *http.Request) {
	// ok: websocket-missing-origin-check
	conn, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		log.Println(err)
		return
	}
}

func handler_check_origin2(w http.ResponseWriter, r *http.Request) {
	upgrader2.CheckOrigin = func(r *http.Request) bool { return true }
	// ok: websocket-missing-origin-check
	conn, err := upgrader2.Upgrade(w, r, nil)
	if err != nil {
		log.Println(err)
		return
	}
}

func handler_doesnt_check_origin(w http.ResponseWriter, r *http.Request) {
	// ruleid: websocket-missing-origin-check
	conn, err := upgrader2.Upgrade(w, r, nil)
	if err != nil {
		log.Println(err)
		return
	}
}
