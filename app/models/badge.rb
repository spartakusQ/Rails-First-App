class Badge < ApplicationRecord
  belongs_to :user
  belongs_to :category, class_name: 'Category', optional: true
  has_many :users_badges
  has_many :users, through: :user_badges


  validates :title, presence: true
  validates :path, presence: true
  validates :name, :image_path, presence: true

  BADGE_NAMES = %i[success_category success_on_first_try success_all_level].freeze

end
