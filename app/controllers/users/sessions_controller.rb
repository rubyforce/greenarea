class Users::SessionsController < Devise::SessionsController
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    if request.xhr?
      # render devise sessions new form instead of new.js.erb of user users/sessions
      render :new_form, :layout => false
    else
      render :html_form
    end
  end
  def create
    self.resource = warden.authenticate(auth_options)
    if self.resource.present?
      sign_in(resource_name, resource)
      flash.now[:success] = I18n.t('devise.sessions.signed_in')

      unless request.xhr?
        redirect_to root_path
      end
    else
      flash.now[:errors] = I18n.t('devise.failure.invalid')

      if request.xhr?
        # render users/sessions/new.js.erb with errors
        render :new, :layout => false
      else
        redirect_to new_user_session_path
      end
    end
  end
end
