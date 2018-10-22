class Test < ApplicationRecord

  belongs_to :category
  has_many :passing_tests
  has_many :users, through: :passing_tests
  has_many :questions
  belongs_to :author, class_name: 'User'

  def self.titles_by_category(title)
    join(:category).where(categories: { title: title }).order(title: :desc).pluck(:title)
  end
end



