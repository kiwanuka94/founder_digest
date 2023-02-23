class UserSubmissionMailer < ApplicationMailer
  def reject(user_submission)
    @name = user_submission.name
    mail(to: user_submission.email, subject: "Sorry, you were rejected!")
  end

  def accept(user_submission, created_user)
    @name = user_submission.name
    @auth_code = created_user.auth_code
    @email = user_submission.email
    
    mail(to: user_submission.email, subject: "Congrats, you were accepted!")
  end

end
