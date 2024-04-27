require 'rails_helper'

module Api
  module V1
    RSpec.describe 'OfferingNotificationService', type: :service do
      describe '.notify_customers_about_new_offerings' do
        let!(:customer1) { create(:user, user_type: :customer) }
        let!(:customer2) { create(:user, user_type: :customer) }
        let!(:salesman) { create(:user, user_type: :salesman) }
        let!(:product) { create(:product) }
        let!(:offering) { create(:offering, product:) }

        before do
          ActionMailer::Base.deliveries.clear
          Api::V1::OfferingsNotificationService.notify_customers_about_new_offering(offering)
        end

        it 'sends new offering notification email to customers' do
          expect(ActionMailer::Base.deliveries.count).to eq(2)

          mail_recipients = ActionMailer::Base.deliveries.map(&:to).flatten
          expect(mail_recipients).to include(customer1.email)
          expect(mail_recipients).to include(customer2.email)
        end

        it 'does not send new offering notification email to salesman' do
          expect(ActionMailer::Base.deliveries.any? { |mail| mail.to.include?(salesman.email) }).to be_falsey
        end

        it 'sends the email with the correct content' do
          mail = ActionMailer::Base.deliveries.first
          expect(mail.body.encoded).to include(product.product_name)
          expect(mail.body.encoded).to include(product.product_description)
          expect(mail.body.encoded).to include(product.product_price.to_s)
        end

        it 'has the correct subject' do
          mail = ActionMailer::Base.deliveries.first
          expect(mail.subject).to eq('New Offering Available')
        end

        it 'includes the offering details' do
          mail = ActionMailer::Base.deliveries.first
          expect(mail.body.encoded).to include(offering.offer_title)
          expect(mail.body.encoded).to include(offering.offer_description)
          expect(mail.body.encoded).to include(offering.offer_start_date.to_s)
          expect(mail.body.encoded).to include(offering.offer_end_date.to_s)
        end
      end
    end
  end
end
