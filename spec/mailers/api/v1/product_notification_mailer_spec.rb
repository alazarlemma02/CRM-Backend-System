# frozen_string_literal: true

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
      end
    end
  end
end
