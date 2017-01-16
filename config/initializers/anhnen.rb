Delayed::Worker.destroy_failed_jobs = false
Delayed::Worker.sleep_delay = 30
Delayed::Worker.max_attempts = 5
Delayed::Worker.max_run_time = 1.hour
Delayed::Worker.max_priority = 10


# Execute normally
mailer.send_email(user)
# Execute asynchronously
mailer.delay.send_email(user)

class Mailer
  def send_email(user)
    UserMailer.activation(user).deliver
  end
  handle_asynchronously :send_email
end


class EmailJob < Struct.new(:user_id)
  def perform
   user = User.find(user_id)
   UserMailer.activation(user).deliver
  end
end

 # Enqueue a job with default settings
Delayed::Job.enqueue EmailJob.new(user.id)

 # Enqueue a job with priority of 1
Delayed::Job.enqueue EmailJob.new(user.id, 1)

 # Enqueue a job with priority of 0, starting tomorrow
Delayed::Job.enqueue EmailJob.new(user.id, 1, 1.day.from_now)
