module Api
  module V1
    class ApplicationMailer < ActionMailer::Base
      default from: 'futurealtech41@gmail.com'
      layout 'mailer'
    end
  end
end
