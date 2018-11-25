class AddTimeLeftToTest < ActiveRecord::Migration[5.2]
  def change
    remove_column :tests, :time_left
    add_column :tests, :test_time_left, :bigint
    add_column :passing_tests, :test_end_time, :bigint
  end
end
