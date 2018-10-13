class User < ApplicationRecord

  def tests_by_level(level)
    tests.by_level(level)
  end
  
end
