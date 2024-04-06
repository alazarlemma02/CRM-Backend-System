# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    RSpec.describe User, type: :model do
      attributes = [
        { first_name: :presence },
        { last_name: :presence },
        { email: %i[presence uniqueness] },
        { phone_number: :presence },
        { password_digest: :presence },
        { user_name: :presence },
        { address: %i[presence belong_to] },
        { role: %i[presence belong_to] },
        { user_type: :presence },
        { user_feedbacks: :have_many },
        { communications: :have_many },
        { product_feedbacks: :have_many }

      ]
      include_examples('model_shared_spec', :user, attributes)
      it { should define_enum_for(:user_type).with_values(%i[customer salesman]) }
      it { should validate_length_of(:password_digest).is_at_least(6) }

      describe 'User active storage' do
        it { is_expected.to have_one_attached(:profile_picture) }
      end

      describe '#profile_picture_url' do
        it 'returns the correct URL when profile picture is attached' do
          user = create(:user)
          file = fixture_file_upload('spec/fixtures/images/user_profile.jpg', 'image/jpg')
          user.profile_picture.attach(file)
          expected_url = Rails.application.routes.url_helpers.rails_blob_url(user.profile_picture, only_path: false)
          expect(user.profile_picture_url).to eq expected_url
        end

        it 'returns nil when profile picture is not attached' do
          user = create(:user)
          expect(user.profile_picture_url).to be_nil
        end
      end
    end
  end
end
