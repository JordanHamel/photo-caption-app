class PhotoMailer < ActionMailer::Base
  default from: "jo.mravca@gmail.com"

  def share_photo(recipient_email, sender_name, photo)
    @photo_url = "http://limitless-river-8895.herokuapp.com/photos/#{photo.id}"
    @sender_name = sender_name
  	mail(to: recipient_email, subject: "#{sender_name} shared a photo with you!")
  end
end
