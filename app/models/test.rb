class Test < ApplicationRecord

  belongs_to :category
  has_many :passing_tests
  has_many :users, through: :passing_tests
  has_many :questions
  belongs_to :author, class_name: 'User'

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, presence: true, uniqueness: { scope: :level, message: 'There can be only one Test with the given name and level' }
  
  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }
  scope :by_level, ->(level) { where(level: level) }
  scope :by_category, ->(title) { joins(:category).where(categories: { title: title }) }


  def self.titles_by_category(title)
    by_category(title).order(title: :desc).pluck(:title)
  end
end



