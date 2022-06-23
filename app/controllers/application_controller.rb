class ApplicationController < ActionController::Base
    protect_from_forgery prepend: true
    before_action :configure_permitted_parameters, if: :devise_controller?
    
  
    protected
  
    def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation)}

            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation)}
    end

    def check_for_admin
        if !current_user.is_admin
            redirect_to root_path, notice: "Error"
        end
    end

  end
  