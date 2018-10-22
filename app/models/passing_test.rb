# frozen_string_literal: true

class PassingTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
end
