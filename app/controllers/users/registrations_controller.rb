class Users::RegistrationsController < Devise::RegistrationsController
  layout false, only: [:new, :create]

  def create
    build_resource(sign_up_params)

    if resource.save
      flash.now[:success] = I18n.t('devise.registrations.signed_up')
      sign_up(resource_name, resource)
    else
      clean_up_passwords resource
      flash.now[:errors] = resource.errors.full_messages.join(', ')
      render :new
    end
  end

  def update
    @user = User.find(current_user.id)

    successfully_updated = if needs_password?(@user, params)
                             @user.update_with_password(params[:user])
                           else
                             # remove the virtual current_password attribute update_without_password
                             # doesn't know how to ignore it
                             params[:user].delete(:current_password)
                             @user.update_without_password(params[:user])
                           end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to edit_user_registration_path
    else
      flash.now[:errors] = resource.errors.full_messages.join(', ')
      render "edit"
    end
  end

  def accreditation
    current_user.update_attributes(sign_up_params)
    render :edit
  end

  def upload_images
    current_user.update_attributes(sign_up_params)
    render :json => current_user.to_json(only: [], methods: [:identification_document_url, :avatar_url])
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :current_password, :avatar, :identification_document,  :individual_income, :securities_firm, :company_director, :company_officer)
  end

  def needs_password?(user, params)
    user.email != params[:user][:email] ||
      !params[:user][:password].blank?
  end
end

