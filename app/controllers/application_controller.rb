# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    permit_param_keys = %i[introduction postal_code address]
    devise_parameter_sanitizer.permit(:sign_up, keys: permit_param_keys)
    devise_parameter_sanitizer.permit(:account_update, keys: permit_param_keys)
  end
end
