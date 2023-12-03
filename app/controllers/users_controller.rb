class UsersController < ApplicationController
    def new
      redirect_to new_user_registration_path
    end
  end
  