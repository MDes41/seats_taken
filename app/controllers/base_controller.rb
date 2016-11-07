class BaseController < ApplicationController
  before_action :authorized?

  def authorized?
    render file: 'public/404.html', status: 404 if current_user.nil?
  end
end
