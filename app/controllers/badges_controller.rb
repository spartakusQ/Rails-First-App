class BadgesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_badge

  def index
    
  end

  private

  def find_badge
    @badge = UserBadge.find(params[:id])
  end

end
