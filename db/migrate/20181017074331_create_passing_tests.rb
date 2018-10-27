# frozen_string_literal: true

class CreatePassingTests < ActiveRecord::Migration[5.2]
  def change
    create_table :passing_tests do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.timestamps
    end
  end
end
