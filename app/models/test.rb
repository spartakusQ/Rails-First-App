class Test < ApplicationRecord

  has_many :passing_tests
  has_many :users, through: :passing_tests

  def self.title_by_category
    by_category(title).order(title: :desc).map(&:title)
  end

  def by_level

  end
  
end


