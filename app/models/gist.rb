class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  def gist_hash_url
    url.split("/").last
  end
end
