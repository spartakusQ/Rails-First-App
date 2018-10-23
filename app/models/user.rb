class User < ApplicationRecord

  has_many :passing_tests
  has_many :tests, through: :passing_tests
  has_many :tests_author, class_name: 'Test', foreign_key: :author_id
  
  validates :email, presence: true

  def tests_by_level(level)
    tests.where(level: level)
  end
end
