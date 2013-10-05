class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook(current_user, request.env["omniauth.auth"])

    if @user.present?
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def google_oauth2
    @user = User.find_for_google(current_user, request.env["omniauth.auth"])

    if @user.present?
      set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def linkedin
    @user = User.find_for_linkedin(current_user, request.env["omniauth.auth"])

    if @user.present?
      set_flash_message(:notice, :success, :kind => "Linkedin") if is_navigational_format?
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.linkedin_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end

