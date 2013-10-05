class ContactsController < ApplicationController
  layout false

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])

    if @contact.save
      ContactMailer.new_contact(@contact).deliver
      flash.now[:success] = I18n.t('contacts.create.success')
    else
      flash.now[:errors] = I18n.t('contacts.create.error')
      render :new
    end
  end
end

