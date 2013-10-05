class Users::PasswordsController < Devise::PasswordsController
  layout false, only: :new

  def new
    self.resource = resource_class.new
    respond_with self.resource
  end

  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    if successfully_sent?(resource)
      flash.now[:success] = I18n.t('devise.passwords.send_instructions')
    else
      flash.now[:errors] = I18n.t('devise.passwords.send_instructions')
      render :new
    end
  end

  private

  def resource_params
    params.require(:user).permit!
  end
end

