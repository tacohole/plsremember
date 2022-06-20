# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def verification_email
    UserMailer.with(user: User.first).verification_email
  end
end
