class UsersController < ApplicationController
  def new
    @user_information = UserInformation.new
  end

  def create
    @user_information = UserInformation.new(user_information_params)
    @user_information.user_id = generate_random_user_id
    
    if @user_information.save
      session[:user_id] = @user_information.user_id
      redirect_to goods_services_path, notice: 'Registration successful!'
    else
      flash.now[:alert] = 'Error(s) in the form. Please correct them.'
      render :new
    end
  end

  private

  def user_information_params
    params.require(:user_information).permit(:name, :username, :address, :photo_url, :contact_information, :password, :password_confirmation)
  end

  def generate_random_user_id
    SecureRandom.random_number(100_000).to_s.rjust(5, '0')
  end

end
