class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :trackable

  has_many :passing_tests
  has_many :tests, through: :passing_tests
  has_many :tests_author, class_name: 'Test', foreign_key: :author_id
  has_many :gists
  has_many :feedbacks
  has_many :user_badges
  has_many :badges, through: :user_badges


  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def tests_by_level(level)
    tests.by_level(level)
  end

  def passing_test(test)
    passing_tests.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end


end
