package testing

import (
    "bytes"
    "fmt"
    "reflect"
)

func (mf mapFmt) Format(s fmt.State, c rune, userInput string) {
    refVal := mf.m
    key := keys[i]
    val := refVal.MapIndex(key)

    // ruleid: unsafe-reflect-by-name
    meth := key.MethodByName(userInput)
    meth.Call(nil)[0]

    return
}

func Test1(job interface{}, userInput string) {
    jobData := make(map[string]interface{})

    valueJ := reflect.ValueOf(job).Elem()

    // ruleid: unsafe-reflect-by-name
    jobData["color"] = valueJ.FieldByName(userInput).String()

    return jobData
}

func OkTest(job interface{}, userInput string) {
    jobData := make(map[string]interface{})

    valueJ := reflect.ValueOf(job).Elem()

    // ok: unsafe-reflect-by-name
    meth := valueJ.MethodByName("Name")
    // ok: unsafe-reflect-by-name
    jobData["color"] = valueJ.FieldByName("color").String()

    return jobData
}
