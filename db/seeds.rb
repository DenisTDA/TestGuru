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

8.times do |index|
  param << { name: "Bob#{index}", email: "bob#{index}@mail.org" }
end

users = User.create(param)
p "Created #{User.count} Users"

param = []
5.times { |index| param << { title: "Topic_#{index}" } }

categories = Category.create(param)
p "Created #{Category.count} Categories"

10.times do |index|
  test = Test.new(title: "Theme_#{index}", level: rand(5))
  categories[rand(categories.size - 1)].tests.push(test)
  users[rand(2..4)].tests.push(test)
  test.save
end
p "Created #{Test.count} Tests"

tests = Test.all
tests.each do |test|
  5.times do |index|
    question = Question.create(body: "Text_body_question__#{test.id}_#{index}")
    test.questions.push(question)
    question.save
  end
end
p "Created #{Question.count} Questions"

questions = Question.all
questions.each do |question|
  4.times do |index|
    answer = Answer.new({ body: "Text_body_answer_#{question.id}_#{index}",
                          correct: (index == 3) })
    question.answers.push(answer)
    answer.save
  end
end
p "Created #{Answer.count} Answers"

users = User.all
tests = Test.all
20.times do |_index|
  result = Result.new
  users[rand(users.size)].results.push(result)
  tests[rand(tests.size)].results.push(result)
  result.save
end
