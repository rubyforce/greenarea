class ContactMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_contact(contact)
    @contact = contact
    mail( to: Rails.configuration.email.support_address, subject: "Contact Us" )
  end
end

