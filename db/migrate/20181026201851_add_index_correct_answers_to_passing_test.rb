class AddIndexCorrectAnswersToPassingTest < ActiveRecord::Migration[5.2]
  def change
    add_reference :passing_tests, :correct_answers, default: 0
  end
end
