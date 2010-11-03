class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def authenticate
    render :text => request.env["omniauth.auth"].to_yaml
  end

end
