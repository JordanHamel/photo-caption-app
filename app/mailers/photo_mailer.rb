class PhotoMailer < ActionMailer::Base
  default from: "jo.mravca@gmail.com"

  def share_photo(recipient_email)
  	mail(to: recipient_email, subject: "I'm sending you a photo!")
  end
end
