class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound do
    render :file => "#{Rails.root}/public/404.html", :status => 404
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_url
  end
end

