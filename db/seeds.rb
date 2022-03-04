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
users_a = User.create!(param)
p "Created #{User.count} Users"

param = []
5.times { |index| param << { title: "Topic_#{index}" } }
categories_a = Category.create!(param)
p "Created #{Category.count} Categories"

tests_a = Test.create!([{ title: 'Theme_1',
                level: 2,
                category: categories_a[0],
                author: users_a[1] },
              { title: 'Theme_2',
                level: 1,
                category: categories_a[1],
                author: users_a[2] },
              { title: 'Theme_3',
                level: 0,
                category: categories_a[3],
                author: users_a[2] },
              { title: 'Theme_4',
                level: 3,
                category: categories_a[2],
                author: users_a[2] },
              { title: 'Theme_5',
                level: 5,
                category: categories_a[2],
                author: users_a[1] },
              { title: 'Theme_6',
                level: 1,
                category: categories_a[1],
                author: users_a[2] },
              { title: 'Theme_7',
                level: 6,
                category: categories_a[3],
                author: users_a[1] }])
p "Created #{Test.count} Tests"

questions_a = Question.create!([{ body: 'Text_body_question_1',
                    test: tests_a[0] },
                  { body: 'Text_body_question_2',
                    test: tests_a[0] },
                  { body: 'Text_body_question_3',
                    test: tests_a[1] },
                  { body: 'Text_body_question_4',
                    test: tests_a[1] },
                  { body: 'Text_body_question_5',
                    test: tests_a[1] },
                  { body: 'Text_body_question_6',
                    test: tests_a[2] },
                  { body: 'Text_body_question_7',
                    test: tests_a[3] },
                  { body: 'Text_body_question_8',
                    test: tests_a[2] },
                  { body: 'Text_body_question_9',
                    test: tests_a[3] },
                  { body: 'Text_body_question_10',
                    test: tests_a[4] },
                  { body: 'Text_body_question_11',
                    test: tests_a[4] },
                  { body: 'Text_body_question_12',
                    test: tests_a[5] },
                  { body: 'Text_body_question_13',
                    test: tests_a[5] },
                  { body: 'Text_body_question_14',
                    test: tests_a[6] }])

p "Created #{Question.count} Questions"

Answer.create!([{ body: 'Text_body_answer_1',
                  question: questions_a[0] },
                { body: 'Text_body_answer_2',
                  correct: true,                  
                  question: questions_a[0] },
                { body: 'Text_body_answer_3',
                  question: questions_a[0] },
                { body: 'Text_body_answer_4',
                  question: questions_a[1] },
                { body: 'Text_body_answer_5',
                  question: questions_a[1] },
                { body: 'Text_body_answer_6',
                  correct: true,
                  question: questions_a[1] },
                { body: 'Text_body_answer_7',
                  question: questions_a[2] },
                { body: 'Text_body_answer_8',
                  correct: true,
                  question: questions_a[2] },
                { body: 'Text_body_answer_9',
                  question: questions_a[3] },
                { body: 'Text_body_answer_10',
                  correct: true,
                  question: questions_a[3] },
                { body: 'Text_body_answer_11',
                  question: questions_a[4] },
                { body: 'Text_body_answer_12',
                  correct: true,
                  question: questions_a[4] },
                { body: 'Text_body_answer_13',
                  question: questions_a[5] }])
p "Created #{Answer.count} Answers"
