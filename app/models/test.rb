class Test < ApplicationRecord

  def self.titles_by_category(title)
    by_category(title).order(title: :desc).pluck(:title)
  end
  
end
