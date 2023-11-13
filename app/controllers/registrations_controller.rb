# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters
  
    def new
      build_resource({})
      resource.build_user_information
      respond_with self.resource
    end
  
    private
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:email, :password, :password_confirmation, :user_information_attributes => [:username, :name, :contact_information, :address, :photo_url])
      end
    end
  end
  