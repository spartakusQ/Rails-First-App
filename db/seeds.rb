# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

test = Test.create([{title: 'Ruby', level: 1},
                   {title: 'Rails', level: 1}])

user = User.create([{email: 'blob@blob.com', username: 'Blob'},
                {email: 'adminBob@blob.com', username: 'Bob'}])

question = Question.create([{body: 'How many years Ruby', test_id: test[0]},
                            {body: 'How many years Rails', test_id: test[1]}])

category = Category.create([{title: 'Front-end'},
                            {title: 'Back-end'}])

answer = Answer.create([{ body: '25', question_id: question[0].id, correct: true },
                       { body: '42', question_id: question[0].id, correct: false }])

passing_tests = PassingTest.create(user_id: user.id, test_id: test.id, current_question_id: nil, correct_answers: nil)
