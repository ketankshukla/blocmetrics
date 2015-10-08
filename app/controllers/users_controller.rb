class UsersController < ApplicationController
  def show
    @registered_applications = current_user.registered_applications
  end
end
