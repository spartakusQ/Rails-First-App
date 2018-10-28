class AddIndexCorrectAnswersToPassingTest < ActiveRecord::Migration[5.2]
  def change
    add_reference :passing_tests, :current_question, foreign_key: true
    add_column :passing_tests, :correct_answers, :integer, default: 0
  end
end
