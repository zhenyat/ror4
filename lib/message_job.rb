################################################################################
#   message_job.rb
#   
#   Handles DJ for Messages
#   
#   Source: http://www.ru.asciicasts.com/episodes/171-delayed-job
#   
#   14.12.2014  ZT Created
#
################################################################################
class MessageJob < Struct.new(:message_d)
  
  ##############################################################################
  # This method MUST BE  
  # 
  # * *Args*    :
  #   - +messages+ - list od messages to be send by email
  # * *Returns* :
  #   - 
  # * *Raises* :
  #   - ++ -
  ##############################################################################
  def perform
    message = Message.find(message_id)  
    message.deliver  
  end  
end




  ##############################################################################
  # Description....  
  # 
  # * *Args*    :
  #   - +arg1+ - first arg
  # * *Returns* :
  #   - 
  # * *Raises* :
  #   - ++ -
  ##############################################################################
  def method_name

  end