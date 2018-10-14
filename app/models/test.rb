class Test < ApplicationRecord

  def self.title_by_category
    by_category(title).order(title: :desc).map(&:title)
  end

end


