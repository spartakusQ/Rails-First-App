class Admin::BadgesController < Admin::BaseController
  before_action :authenticate_user!  
  before_action :find_badge, only: %i[destroy edit update show]

  def index
    @badges = Badge.all
    @user_bages = UserBadge.all
  end

  def new
    @badge = Badge.new
  end

  def edit
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to [:admin, @badge], notice: 'Badge was successfully created.'
    else
      render [:admin, :new]
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to [:admin, @badge], notice: 'Badge was successfully updated.'
    else
      render [:admin, :edit]
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_url, notice: 'Badge was successfully destroyed.'
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :image, :rule)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def find_badges
    @badges = Badge.all
  end
end
