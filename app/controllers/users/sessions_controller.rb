class Users::SessionsController < Devise::SessionsController
  after_action :set_greeting, only: :create

  protected

  def set_greeting
    flash[:notice] = "Greetings, #{current_user.first_name}"
  end
end
