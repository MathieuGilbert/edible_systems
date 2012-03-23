class ContactMailer < ActionMailer::Base
  default :from => "contact@ediblesystems.com"

  def contact_email(name, email, message)
    @name = name
    @email = email
    @message = message

    mail(:to => "matnarak@gmail.com", :subject => "Contact message from EdibleSystems")
  end
end
