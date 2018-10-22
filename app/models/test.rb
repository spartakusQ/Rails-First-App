class Test < ApplicationRecord

  has_many :passing_tests
  has_many :users, through: :passing_tests

  def self.title_by_category(category_title)
    Test.by_category('fgsgasgdasgd')
  end

  def tests_by_level
    puts '12'
  end
  


  
end


# Test.joins('...').where(...).where(level: level)