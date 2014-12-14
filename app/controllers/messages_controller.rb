  ##############################################################################
  # Create a message in background since it causes an expensive system call
  # this will cause a job to be queued in delayed job and be executed later
  # in a background thread, but the job will be scheduled for 1 minute in the future
  #
  # Source:  http://runnable.com/Ur2lvBES_vRUAAOA/how-to-schedule-background-jobs-at-future-time-with-delayedjob-for-ruby-on-rails-and-delayed_job
  #
  # 12.12.2014
  ##############################################################################
class MessagesController < ApplicationController
  include ZT

  # Displays all collected Fortune messages
  def index
#    if request.post?
      Message.delay(run_at: 1.minute.from_now).create_message
#    end

    # Retrieve the last 10 msgs
    @bottom = Message.order("id desc")#.limit(10)
  end

  def new
    if request.post?
      Message.create_message
    end
  end

  # Sends notification via DelayedJob (DJ)
  # Pay attention: if 'delay' - no 'deliver'
  def notification
    if request.post?
      zt_log params
      last_message = Message.last
      unless last_message.nil?
        subject = "#{params[:notification][:subject]} created at: #{Time.now}"

        if params[:notification][:delay] == 'true'
          MessageMailer.delay(run_at: 1.minute.from_now).notification(subject, last_message)   # no deliver here!
          flash[:notice] = "Уведомление поставлено в очередь на отправку"
          redirect_to :back
        else
          MessageMailer.notification(subject, last_message).deliver
          flash[:notice] = "Уведомление успешно отправлено"
          redirect_to :back
        end
      end
    end
  end
end
