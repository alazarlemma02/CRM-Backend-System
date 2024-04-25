require 'rails_helper'

module Api
  module V1
    RSpec.describe ProductNotificationService, type: :service do
      describe '.notify_customers_about_new_product' do
        let!(:customer1) { create(:user, user_type: :customer) }
        let!(:customer2) { create(:user, user_type: :customer) }
        let!(:salesman) { create(:user, user_type: :salesman) }
        let!(:product) { create(:product) }

        it 'sends new product notification email to customers' do
          expect(Api::V1::ProductNotificationMailer).to receive(:new_product_email).twice.and_call_original

          Api::V1::ProductNotificationService.notify_customers_about_new_product(product)
        end

        it 'does not send new product notification email to salesman' do
          expect(Api::V1::ProductNotificationMailer).not_to receive(:new_product_email).with(salesman, product)
        end

        it 'sends the email to the correct recipients' do
          Api::V1::ProductNotificationService.notify_customers_about_new_product(product)
          emails = ActionMailer::Base.deliveries
          expect(emails.count).to eq(2)
          expect(emails.map(&:to).flatten).to match_array([customer1.email, customer2.email])
        end

        it 'sends the email with the correct content' do
          Api::V1::ProductNotificationService.notify_customers_about_new_product(product)
          mail = ActionMailer::Base.deliveries.last
          expect(mail.body.encoded).to include(product.product_name)
          expect(mail.body.encoded).to include(product.product_description)
          expect(mail.body.encoded).to include(product.product_price.to_s)
        end
      end
    end
  end
end
