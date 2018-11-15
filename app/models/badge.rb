class Badge < ApplicationRecord
  belongs_to :user
  has_many :users_badges
  has_many :users, through: :user_badges
  belongs_to :category, class_name: 'Category', optional: true

  validates :title, presence: true
  validates :path, presence: true
  validates :name, :image, presence: true

  BADGE_NAMES = %i[success_category success_on_first_try success_all_level].freeze

end
