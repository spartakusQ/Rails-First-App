class AddTimeLeftToPassingTests < ActiveRecord::Migration[5.2]
  def change
    add_column :passing_tests, :time_left, :bigint
  end
end
