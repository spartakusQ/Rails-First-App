class AddReferenceToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :category, foreign_key: true, index: true
  end
end
