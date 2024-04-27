require 'rails_helper'

module Api
  module V1
    RSpec.describe UserMailer, type: :mailer do
      describe '#welcome_email' do
        let(:user) { create(:user) }

        it 'sends a welcome email' do
          email = Api::V1::UserMailer.welcome_email(user)
          expect(email.subject).to eq('Welcome to our System!')
          expect(email.to).to eq([user.email])
        end
      end

      describe '#forgot_password' do
        let(:user) { create(:user) }
        let(:mail) { described_class.forgot_password(user) }

        before do
          user.generate_password_token!
        end

        it 'renders the headers' do
          expect(mail.subject).to eq('Password Reset Instructions')
          expect(mail.to).to eq([user.email])
        end

        it 'renders the body' do
          expect(mail.body.encoded).to match(user.reset_password_token)
        end
      end
    end
  end
end
