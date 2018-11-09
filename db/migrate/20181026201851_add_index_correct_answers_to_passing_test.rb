class AddIndexCorrectAnswersToPassingTest < ActiveRecord::Migration[5.2]
  def change
    add_column :passing_tests, :current_question_id, :integer, index: true
    add_column :passing_tests, :correct_answers, :integer, default: 0
  end
end
