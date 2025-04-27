# frozen_string_literal: true

# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
  respond_to :json
  include Devise::Controllers::Helpers
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name avatar])
  end
end
