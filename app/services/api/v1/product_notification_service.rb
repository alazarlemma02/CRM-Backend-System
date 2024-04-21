# frozen_string_literal: true

module Api
  module V1
    class ProductNotificationService
      def self.notify_customers_about_new_product(product)
        customers = Api::V1::User.where(user_type: Api::V1::User.user_types[:customer]).pluck(:email)

        customers.each do |customer|
          Api::V1::ProductNotificationMailer.new_product_email(customer, product).deliver_now
        end
      end
    end
  end
end
