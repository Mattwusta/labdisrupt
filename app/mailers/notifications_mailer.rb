class NotificationsMailer < ActionMailer::Base
   default :from => "noreply@gurus.com.tw"
  default :to => "matthew.wu328@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[Chef29 Contact] #{message.subject}" )
    mail(:body => "[聯絡主題] #{message.subject} [內容] #{message.body}" )
  end

end