module Api
  module V1
    class UserMailer < ApplicationMailer
      def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to our System!')
      end

      def forgot_password(user)
        @user = user

        @forgot_password_url = "#{ENV['FRONTEND_URL']}/reset-password?token=#{user.reset_password_token}"
        mail(to: @user.email, subject: 'Password Reset Instructions')
      end
    end
  end
end
