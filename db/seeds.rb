# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




test = Test.create(title: 'Ruby', level: 1)

user = User.create( email: 'bob@blob.com', username: 'Bob')

question = Question.create(body: 'Some one', test_id: test.id)

category = Category.create(title: 'Front')

answer = Answer.create(body: 'Some one', correct: true, question_id: question.id)

passing_tests = PassingTest.create(user_id: user.id, test_id: test.id, current_question_id: nil, correct_answers: nil)

