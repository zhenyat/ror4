class MessageMailer < ActionMailer::Base
  default from: ZT_CONFIG['mail']['from']
  default bcc:  ZT_CONFIG['mail']['bcc']

  def notification subject, message
    recipient = 'telyukov@mail.ru'
    @last_message = message
    mail to: recipient, subject: subject
  end
end
