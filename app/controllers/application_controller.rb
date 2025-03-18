# frozen_string_literal: true

class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  before_action :authenticate_user!, unless: :devise_controller?

  helper_method :current_organisation

  private

  def current_organisation
    current_user.organisation
  end
end
