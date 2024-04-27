module Api
  module V1
    class OfferingsNotificationService
      # .notify_customers_about_new_offering
      # This method sends an email to all customers about a new offering
      def self.notify_customers_about_new_offering(offering)
        customers = Api::V1::User.where(user_type: Api::V1::User.user_types[:customer]).pluck(:email)

        customers.each do |customer|
          Api::V1::OfferingNotificationMailer.new_offering_email(customer, offering).deliver_now
        end
      end
    end
  end
end
