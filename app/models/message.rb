class Message < ActiveRecord::Base
  # Expensive system call (creates a shell and execute a command)
  def self.create_message
    text = %x(/usr/local/bin/fortune)
    Message.create!(text: text)
  end
end
