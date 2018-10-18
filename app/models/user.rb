class User < ApplicationRecord
  has_many :passing_tests
  has_many :tests, through: :passing_tests


  def tests_by_level(level)
    tests.by_level
  end



end
