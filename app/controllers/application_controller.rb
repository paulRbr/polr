class ApplicationController < ActionController::Base
  include Shortener::ShortenerHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    render layout: "application"
  end

  def shorten
    full_url = params[:url]
    custom_key = params[:custom_key]
    options = { url_options: Rails.application.routes.default_url_options }
    options.merge!({ custom_key: custom_key }) if custom_key.present?

    render plain: full_url.present? ? short_url(full_url, options) : ""
  end
end
