class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session
  protected
  
  def after_sign_in_path_for(resource)
     books_path
  end

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email]) 
    end

end
