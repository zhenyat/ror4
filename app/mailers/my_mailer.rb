################################################################################
#   Mailer Learning
#
#   Source: http://guides.rubyonrails.org/action_mailer_basics.html
#
#   22.03.2014  ZT
#
################################################################################
#   Steps
#     1) Generate the Mailer:                     $ rails g mailer MyMailer
#     2) Edit the Mailer (defaults and methods):  my_mailer.rb
#     3) Create the Mailer View:                  hello_email.html.erb
#                                                 hello_email.text.erb
#     4) Edit pages_controller method:            send_msg
#     5) created folder with attachments:         public/mail_attachments
#     6) Add the Mailer configuration parameters: zt_config_yml
################################################################################
class MyMailer < ActionMailer::Base
  default from: ZT_CONFIG['mail']['from']
  default bcc:  ZT_CONFIG['mail']['bcc']

  def hello_email name, email, subject, files = []
    @name     = name      # Name: applied to message body
    recipient = email     # Address

    # Headers
    headers[:Organization] = 'ZT Lab'  # Additional Header

    # Attachments
    if files.count > 0
      files.each do |filename|
        attachments["#{filename}"] = File.read("#{ZT_CONFIG['mail']['path']}/#{filename}")
      end
    end

    mail to: recipient, subject: subject
  end
end
