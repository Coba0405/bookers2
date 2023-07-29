class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_fr(resource)
    user_path(params[:id])
  end
  
  def after_sign_out_path_for(resource)
    root_path    
  end
  
  def index
    @user = current_user
    @users = User.all
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end