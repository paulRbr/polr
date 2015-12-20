class ApplicationController < ActionController::Base
  include Shortener::ShortenerHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def shorten
    full_url = params[:url]

    render plain: full_url.present? ? short_url(full_url) : ""
  end
end
