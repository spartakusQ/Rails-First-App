class BadgesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_badge, only: [:show]

  def index
    # @badges = current_user.badges.all
    # @user_badges = current_user.badges
    # @accessible_badges = Badge.all
  end

  private

  def find_badge
    @badge = UserBadge.find(params[:id])
  end

end
