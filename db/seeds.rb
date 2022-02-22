# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([{
  name: "Vasiliy",
  email: "vas@mail.org"
},
{
  name: "Petr",
  email: "petr@mail.org",
  admin: true
},
{
  name: "Sergey",
  email: "serg@mail.org",
  admin: true
}])
p "Created #{User.count} Users"

Category.create!([{
  title: "Oceans"
},
{
  title: "Deserts"
},
{
  title: "Mountains"
},
{
  title: "Aircrafts"
}])
p "Created #{Category.count} Categories"

Test.create!([{
  title: "Urals mounains",
  level: 1,
  category_id: 3, 
  author_id: 2
},
{
  title: "Pacific ocean",
  level: 2,
  category_id: 1, 
  author_id: 3
},
{
  title: "Paragliders",
  level: 3,
  category_id: 4, 
  author_id: 3
},
{
  title: "Sahara",
  category_id: 2, 
  author_id: 2
}])
p "Created #{Test.count} Tests"


Question.create!([{
  body: "Еhe highest point in the Ural Mountains",
  test_id: 1
},
{
  body: "Average annual temperature of the Pacific Ocean",
  test_id: 2
},
{
  body: "What average wing area is needed for 
          a pilot weighing 85 kg. with equipment of 15 kg?",
  test_id: 3
},
{
  body: "What is the average temperature during the day in the sahara desert in summer?",
  test_id: 4,
},
{
  body: "The highest part of the Ural Mountains is located:",
  test_id: 1
},
{
  body: "Pacific Ocean area",
  test_id: 2
},
{ 
  body: "What is the trim speed of the class pgliderg En-B?",
  test_id: 3
},
{
  body: "What is area Sahara?",
  test_id: 1
}])
p "Created #{Question.count} Questions"

Answer.create!([{
  body: "1200 m",
  question_id: 1
},
{
  body: "1895 m",
  correct: true,
  question_id: 1
},
{
  body: "895 m",
  question_id: 1
},
{
  body: "10°C",
  question_id: 2
},
{
  body: "45°C",
  question_id: 2
},
{
  body: "19°C",
  correct: true,
  question_id: 2
},
{
  body: "22",
  question_id: 3
},
{
  body: "32",
  question_id: 3
},
{
  body: "27",
  correct: true,
  question_id: 3
},
{
  body: "19°C",
  question_id: 4
},
{
  body: "50°C",
  question_id: 4
},
{
  body: "28°C",
  correct: true,
  question_id: 4
},
{
  body: "south",
  question_id: 5
},
{
  body: "north",
  correct: true,
  question_id: 5
},
{
  body: "central",
  question_id: 5
},
{
  body: "367 618 km^2",
  question_id: 6
},
{
  body: "165 200 000 km^2",
  correct: true,
  question_id: 6
},
{
  body: "256 235 114 km^2",
  question_id: 6
},
{
  body: "26 km/h",
  correct: true,
  question_id: 7
},
{
  body: "15 km/h",
  question_id: 7
},
{
  body: "38 km/h",
  question_id: 7
},
{
  body: "9 200 000 km^2",
  correct: true,
  question_id: 8
},
{
  body: "15 025 368 km^2",
  question_id: 8
},
{
  body: "3 263 004 km^2",
  question_id: 8
}])
p "Created #{Answer.count} Answers"

Result.create!([{
  user_id: 1,
  test_id: 2
},
{
  user_id: 2,
  test_id: 2
},
{
  user_id: 2,
  test_id: 1
},
{
  user_id: 2,
  test_id: 3
},
{
  user_id: 1,
  test_id: 4
},
{
  user_id: 3,
  test_id: 1
},
{
  user_id: 3,
  test_id: 2
},
{
  user_id: 3,
  test_id: 3
},
{
  user_id: 1,
  test_id: 4
}])
p "Created #{Answer.count} Answers"
