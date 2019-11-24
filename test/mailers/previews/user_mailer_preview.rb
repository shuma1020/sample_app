# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

<<<<<<< HEAD
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/account_activation
=======
   # Preview this email at
  # http://localhost:3000/rails/mailers/user_mailer/account_activation
>>>>>>> advanced-login
  def account_activation
    user = User.first
    user.activation_token = User.new_token
    UserMailer.account_activation(user)
  end

<<<<<<< HEAD
=======


>>>>>>> advanced-login
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    UserMailer.password_reset
  end

end
