require "digest/sha1"

class User < ApplicationRecord

  include Auth  

  has_many :passing_tests
  has_many :tests, through: :passing_tests
  has_many :tests_author, class_name: 'Test', foreign_key: :author_id

  has_secure_password

  def tests_by_level(level)
    tests.by_level(level)
  end

  def passing_test(test)
    passing_test.order(id: :desc).find_by(test_id: test.id)
  end


end
