# frozen_string_literal: true

class User < ApplicationRecord
  has_many :passing_tests
  has_many :tests

  def tests_by_level(level)
    tests.where(level: level)
  end
end
