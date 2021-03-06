class SessionsController < ApplicationController

  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    redirect_to timeline_index_path
  end

  def destroy
    session.destroy
    flash.now[:logout] = "goodbye"
    redirect_to root_path
  end
end
