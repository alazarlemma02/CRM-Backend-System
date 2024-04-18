# frozen_string_literal: true

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
    end
  end
end
