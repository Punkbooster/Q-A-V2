class ApplicationController < ActionController::Base
  include ApplicationHelper

  layout 'application'

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_user_time_zone

  protected

  def set_user_time_zone
    Time.zone = current_user.time_zone if user_signed_in?
  end  

  def configure_permitted_parameters
    keys = [:company_name, :time_zone, :country]

    devise_parameter_sanitizer.permit(:sign_up, keys: keys)
    devise_parameter_sanitizer.permit(:account_update, keys: keys)
  end

  def after_sign_in_path_for(resource)
    events_path # <- Path you want to redirect the user to.
  end

end
