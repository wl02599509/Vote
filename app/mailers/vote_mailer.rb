class VoteMailer < ApplicationMailer
 
    def vote_notify(email) 
      mail to: email, subject: 'hi'
    end
end
