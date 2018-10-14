class User < ApplicationRecord

  def tests_by_level(level)
    tests.tests_by_level(level)
  end
  
end
