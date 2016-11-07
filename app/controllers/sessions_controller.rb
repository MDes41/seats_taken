class SessionsController < ApplicationController
  def new
  end

  def create
    User.find_by(email: params[:email])
  end
end
