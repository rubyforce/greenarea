class Users::SessionsController < Devise::SessionsController
  respond_to :json

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
    if request.format != :json
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
    else
      email = params[:email]
      password = params[:password]

      @user = User.find_by_email(email)

      if @user.nil?
        logger.info("User #{email} failed signin, user cannot be found.")
        render status: 401, json: '"title" = "Error"; "message" = "Invalid email or password"; "button"="Dismiss";'
        return
      end

      if not @user.valid_password?(password)
        logger.info("User #{email} failed signin, password \"#{password}\" is invalid")
        render status: 401, json: '"title" = "Error"; "message" = "Invalid email or password"; "button"="Dismiss";'
      else
        @user.ensure_authentication_token!
        render status: 200, json: { authentication_token: @user.authentication_token, email: @user.email, id: @user.id }
      end
    end
  end

  def destroy
    if request.format != :json
      super
    else
      auth_token = params[:auth_token]

      @user = User.where(authentication_token: auth_token).first

      unless @user.nil?
        @user.reset_authentication_token!
        render json: { message: "Session deleted" }, success: true, status: :ok
      else
        render json: { message: "Invalid authentication token" },  success: false
      end
    end
  end
end
