class Answer < ApplicationRecord
  belongs_to :question
  MAX_ANSWERS_COUNT = 4

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  
  validate :validate_max_answers_count, on: :create

  def validate_max_answers_count
    errors.add(:question, message) if question.answers.count >= MAX_ANSWERS_COUNT
  end
  
end
