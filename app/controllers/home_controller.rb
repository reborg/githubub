class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:authenticate]

  def authenticate
    #render :text => request.env["omniauth.auth"].to_yaml
    omniauth = request.env["omniauth.auth"]
    if current_user
      flash[:notice] = "User already authenticated succesfully."
      redirect_to root_url
    else
      email = omniauth['user_info']['email']
      user = User.find_by_email(email) || User.create(:email => email)
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, user)
    end
  end

end
