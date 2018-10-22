# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  has_many :passing_tests
  has_many :users, through: :passing_tests

  def self.titles_by_category(title)
    join(:category).where(categories: { title: title }).order(title: :desc).pluck(:title)
  end
end

# Client.where(active: true).pluck(:id)
