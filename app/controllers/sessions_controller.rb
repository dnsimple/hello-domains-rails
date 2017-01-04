require_relative 'sessions/create_params'

class SessionsController < ApplicationController
  def create
    data   = CreateParams.new(request.env)
    user   = User.find_or_create_by_uid(params[:uid], data)
    session[:user_id] = user.id

    redirect_to root_url
  end
end
