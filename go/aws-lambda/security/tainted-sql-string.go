package main

import (
	"database/sql"
	"encoding/json"
	"log"
	"os"
	"strconv"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	_ "github.com/go-sql-driver/mysql"
)

var (
	db               *sql.DB
	err              error
	connectionString string
	dbUser           string
	dbPass           string
	dataSource       string
)

type Employee struct {
	EmployeeNo int    `json:"emp_no"`
	FirstName  string `json:"first_name"`
	LastName   string `json:"last_name"`
}

func init() {
	connectionString = os.Getenv("CONN")
	dbUser = os.Getenv("DBUSER")
	dbPass = os.Getenv("DBPASS")
	dataSource = dbUser + ":" + dbPass + "@tcp(" + connectionString + ")/employees"
}

func handler(request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {

	searchCriteria := request.Body

	db, err = sql.Open("mysql", dataSource)
	if err != nil {
		panic(err.Error())
	}

	defer db.Close()

	// ruleid: tainted-sql-string
	results, err := db.Query("select e.emp_no, e.first_name, e.last_name " +
		"from employees e, departments d, dept_emp de " +
		"where e.last_name LIKE '" + searchCriteria + "%';")

	if err != nil {
		log.Fatal(err)
	}
	defer results.Close()
	// ruleid: tainted-sql-string
	_, err = db.Exec(` 
  DELETE FROM table WHERE Id = ` + request.Get("Id"))
	// ruleid: tainted-sql-string
	_, err = db.Exec("DELETE FROM table WHERE Id = " + request.Get("Id"))

	// ok: tainted-sql-string
	log.Printf("DELETE FROM table WHERE Id = " + request.Get("Id"))
	// ok: tainted-sql-string
	_, err = db.Exec(` FAKE
  DELETE FROM table WHERE Id = ` + request.Get("Id"))

	idhtml := request.Get("Id")
	id, _ := strconv.Atoi(idhtml)

	// ok: tainted-sql-string
	_, err = db.Exec("DELETE FROM table WHERE Id = " + id)

	// ok: tainted-sql-string
	results2, err2 := db.Query("select * from foobar")

	employees := make([]Employee, 0)

	for results.Next() {
		var e Employee

		err := results.Scan(&e.EmployeeNo, &e.FirstName, &e.LastName)
		if err != nil {
			log.Fatal(err)
		}
		employees = append(employees, e)
	}

	data, _ := json.Marshal(employees)

	return events.APIGatewayProxyResponse{
		StatusCode:      200,
		Body:            string(data),
		IsBase64Encoded: false,
	}, nil
}

func main() {
	lambda.Start(handler)
}
