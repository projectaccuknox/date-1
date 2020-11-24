package main

import (
    "fmt"
    "time"
)

func main() {
    loc, _ := time.LoadLocation("Asia/Calcutta")
    now := time.Now().In(loc)
//    fmt.Println(now)
   fmt.Println(now.Format("01-02-2006 15:04:05"))
}
