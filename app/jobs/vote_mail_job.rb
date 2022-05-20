class VoteMailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    VoteMailer.vote_notify('wl02599509@gmail.com').deliver
  end
end
