# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
  end

  def create
    email_or_username = params[:session][:email_or_username]
    password = params[:session][:password]

    user_information = UserInformation.find_by(contact_information: email_or_username) || UserInformation.find_by(username: email_or_username)

    if user_information && user_information.authenticate(password)
      session[:user_id] = user_information.user_id
      puts session[:user_id]
      redirect_to goods_services_path, notice: 'Login successful!'
    else
      flash.now[:alert] = 'Invalid email/username or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out successfully!'
  end
end
