class User < ApplicationRecord
  has_many :passing_tests
  has_many :tests


  def tests_by_level(level)
   Test.joins(:users).where(passing_tests: {user_id: user.id, test_id: test.id})
  end



end

# Test.joins('user').where(user: user_id).where(level: level)