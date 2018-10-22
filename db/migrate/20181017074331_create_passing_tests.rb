# frozen_string_literal: true

class CreatePassingTests < ActiveRecord::Migration[5.2]
  def change
    create_table :passing_tests do |t|
      t.integer :user_id
      t.integer :test_id
      t.integer :current_question_id
      t.integer :correct_answers

      t.timestamps
    end
  end
end
