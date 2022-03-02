# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Answer.delete_all
Question.delete_all
Test.delete_all
Category.delete_all
Result.delete_all
User.delete_all

param = []
users_a = []
tests_a = []
questions_a = []
answers_a = []
categories_a = []
8.times do |index|
  param << { name: "Bob#{index}", email: "bob#{index}@mail.org" }
end
users_a = User.create!(param)
p "Created #{User.count} Users"

param = []
5.times { |index| param << { title: "Topic_#{index}" } }
categories_a = Category.create!(param)
p "Created #{Category.count} Categories"

10.times do |index|
  Test.create!(title: "Theme_#{index}",
               level: rand(5),
               category: categories_a[rand(categories_a.size - 1)],
               author: users_a[rand(2..4)])
end
p "Created #{Test.count} Tests"

50.times do |index|
  tests_a = Test.all.to_a if tests_a.empty?
  Question.create!(body: "Text_body_question_#{tests_a.last.id}_#{index}",
                   test: tests_a.pop)
end
p "Created #{Question.count} Questions"

200.times do |index|
  questions_a = Question.all.to_a if questions_a.empty?
  Answer.create!(body: "Text_body_answer_#{questions_a.last.id}_#{index}",
                 correct: (index % 3 == 0),
                 question: questions_a.pop)
end
p "Created #{Answer.count} Answers"

users_a = User.all
tests_a = Test.all
20.times do |_index|
  Result.create!(user: users_a[rand(users_a.size)],
                 test: tests_a[rand(tests_a.size)])
end
