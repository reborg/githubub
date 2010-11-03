class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:authenticate]

  def index
  end

  def authenticate
    #render :text => request.env["omniauth.auth"].to_yaml
    omniauth = request.env["omniauth.auth"]
    if current_user
      flash[:notice] = "Authentication successful."
      redirect_to dashboard_url
    else
      user = User.new
      user.apply_omniauth(omniauth)
      if user.save
        flash[:notice] = "Signed in successfully."
        sign_in_and_redirect(:user, user)
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end
  end

end
