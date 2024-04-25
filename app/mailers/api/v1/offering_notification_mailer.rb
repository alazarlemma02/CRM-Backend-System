module Api
  module V1
    class OfferingNotificationMailer < ApplicationMailer
      def new_offering_email(customer_email, offering)
        @offering = offering
        @product = offering.product
        mail(to: customer_email, subject: 'New Offering Available')
      end
    end
  end
end
