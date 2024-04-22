# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    RSpec.describe 'ProductNotificationService', type: :service do
      describe '.notify_customers_about_new_product' do
        let!(:customer1) { create(:user, user_type: :customer) }
        let!(:customer2) { create(:user, user_type: :customer) }
        let!(:salesman) { create(:user, user_type: :salesman) }
        let!(:product) { create(:product) }

        before do
          ActionMailer::Base.deliveries.clear
        end

        it 'sends new product notification email to customers' do
          ProductNotificationService.notify_customers_about_new_product(product)
          expect(ActionMailer::Base.deliveries.count).to eq(2)
          expect(ActionMailer::Base.deliveries.first.to).to include(customer1.email)
          expect(ActionMailer::Base.deliveries.second.to).to include(customer2.email)
        end

        it 'does not send new product notification email to salesman' do
          ProductNotificationService.notify_customers_about_new_product(product)
          expect(ActionMailer::Base.deliveries.any? { |mail| mail.to.include?(salesman.email) }).to be_falsey
        end

        it 'sends the email with the correct content' do
          ProductNotificationService.notify_customers_about_new_product(product)
          mail = ActionMailer::Base.deliveries.first
          expect(mail.body.encoded).to include(product.product_name)
          expect(mail.body.encoded).to include(product.product_description)
          expect(mail.body.encoded).to include(product.product_price.to_s)
        end
      end
    end
  end
end
