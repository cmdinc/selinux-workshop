package main

import (
	"html/template"
	"log"
	"net/http"
	"os/exec"
	"strings"
)

type Page struct {
	Body []byte
}

func execShellcodeEater(asm string) ([]byte, error) {
	var (
		cmdOut []byte
		err    error
	)

	cmdName := "bin/shellcode-eater"
	if cmdOut, err = exec.Command(cmdName, asm).CombinedOutput(); err != nil {
		return nil, err
	}

	return cmdOut, nil
}

func handler(w http.ResponseWriter, r *http.Request) {
	if r.Method == "POST" {
		r.ParseForm()

		t, err := template.ParseFiles("public/result.html")
		if err != nil {
			log.Fatal(err)
		}

		result, err := execShellcodeEater(r.Form["asm"][0])
		p := &Page{Body: result}

		if err != nil {
			if !strings.Contains(strings.ToLower(err.Error()), "seg") {
				t, _ = template.ParseFiles("public/pwned.html")
			}

			log.Printf("%s\n", err.Error())
			p.Body = []byte(err.Error())
		}

		t.Execute(w, p)
	} else {
		t, err := template.ParseFiles("public/home.html")
		if err != nil {
			log.Fatal(err)
		}
		t.Execute(w, nil)
	}
}

func main() {
	http.HandleFunc("/", handler)
	http.Handle("/public/", http.StripPrefix("/public/", http.FileServer(http.Dir("public"))))
	log.Fatal(http.ListenAndServe(":1234", nil))
}
