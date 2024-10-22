class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_contriller?
  before_action :authenticate_user!

  # skip_before_action :authenticate_user!, only: [:show]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer(:sign_up, keys: %i[first_name last_name terms_and_conditions])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[irst_name last_name])
  end
end
