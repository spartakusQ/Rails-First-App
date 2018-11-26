class DeleteTestTimeLeftToTest < ActiveRecord::Migration[5.2]
  def change
    remove_column :tests, :test_time_left
    remove_column :passing_tests, :test_end_time
  end
end
