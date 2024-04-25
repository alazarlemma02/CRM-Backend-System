module Api
  module V1
    class UserMailer < ApplicationMailer
      def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to our System!')
      end
    end
  end
end
