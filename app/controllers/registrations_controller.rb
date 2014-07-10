class RegistrationsController < ApplicationController
  def create
    @user = User.new(registration_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to short_links_path, notice: "Your account has been created"
    else
      redirect_to root_path, alert: "There was an issue creating your account"
    end
  end

  private

  def registration_params
    {
      username: params[:username],
      password: params[:password]
    }
  end
end
