3.times do 
  Family.create
end

Assignment.create(person: "Caleb", family: Family.first, age: "adult")
Assignment.create(person: "Ruth", family: Family.first, age: "adult")
Assignment.create(person: "Gideon", family: Family.first, age: "child")
Assignment.create(person: "Lillian", family: Family.first, age: "child")


Assignment.create(person: "Dakota", family: Family.second, age: "adult")
Assignment.create(person: "Carlee", family: Family.second, age: "adult")
Assignment.create(person: "Izzie", family: Family.second, age: "child")
Assignment.create(person: "Boyd", family: Family.second, age: "child")

Assignment.create(person: "Tobey", family: Family.third, age: "adult")
Assignment.create(person: "Cortney", family: Family.third, age: "adult")
Assignment.create(person: "Holly", family: Family.third, age: "child")
Assignment.create(person: "Mercy", family: Family.third, age: "child")

