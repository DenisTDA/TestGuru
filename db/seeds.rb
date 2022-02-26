# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Answer.delete_all
# Question.delete_all
# Test.delete_all
# Category.delete_all
# Result.delete_all
# User.delete_all

param = []

8.times do |index|
  param << { name: "Bob#{index}", email: "bob#{index}@mail.org" }
end

users = User.create(param)
p "Created #{User.count} Users"

param = []
10.times { |index| param << { title: "Topic_#{index}" } }

categories = Category.create(param)
p "Created #{Category.count} Categories"

param = []
30.times do |index|
  param <<
    { title: "Theme_#{index}",
      level: rand(5),
      category_id: categories.sample.id,
      author_id: users[1..5].sample.id }
end

tests = Test.create(param)
p "Created #{Test.count} Tests"

param = []
50.times do |index|
  param <<
    { body: "Text_body_question__#{index}",
      test_id: tests.sample.id }
end

questions = Question.create(param)
p "Created #{Question.count} Questions"

param = []
200.times do |index|
  { body: "Text_body_answer__#{index}",
    qwestion_id: tests.sample.id,
    correct: (true if (index / 5).nil?) }
end

answers = Answer.create(param)
p "Created #{Answer.count} Answers"

users_id = User.pluck(:id)
tests_id = Test.pluck(:id)
param = []

20.times do |_index|
  test = tests_id.sample
  user = users_id.sample
  param << { test_id: test, user_id: user }
end
pp param

Result.create(param)
