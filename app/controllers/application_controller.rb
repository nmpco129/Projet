class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  include RedirectBack

  helper_method :resource_class, :resource, :resource_name, :devise_mapping
  protect_from_forgery with: :exception

  def set_locale
   I18n.locale = params[:locale] || I18n.default_locale
  end


  def current_user
    super || NilUser.new
  end

  def user_signed_in?
    !current_user.nil?
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

    def resource_name
      :user
    end

    def resource
      @resource ||= User.new
    end

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end

    def resource_class
      User
    end

    def configure_permitted_parameters

    end
end
