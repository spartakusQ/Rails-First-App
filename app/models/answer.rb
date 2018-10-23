class Answer < ApplicationRecord
  belongs_to :questions

  scope :correct, -> { where(correct: true) }
end
