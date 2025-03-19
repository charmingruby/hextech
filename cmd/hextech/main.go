package main

import "net/http"

func main() {
	http.HandleFunc("/health-check", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		w.Write([]byte("Healthy!"))
	})

	http.ListenAndServe(":3000", nil)
}
