class HomeController < ApplicationController

  def index
  end

  def authenticate
    render :text => request.env["omniauth.auth"].to_yaml
  end

end
