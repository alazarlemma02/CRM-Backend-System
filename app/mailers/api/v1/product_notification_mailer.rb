# frozen_string_literal: true

module Api
  module V1
    class ProductNotificationMailer < ApplicationMailer
      def new_product_email(customer_email, product)
        @product = product
        mail(to: customer_email, subject: 'New Product Available')
      end
    end
  end
end
