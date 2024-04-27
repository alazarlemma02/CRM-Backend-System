require 'rails_helper'

module Api
  module V1
    RSpec.describe ProductFeedback, type: :model do
      attributes = [
        { feedback_content: :presence },
        { product_rating: :presence },
        { user: :belong_to },
        { product: :belong_to }
      ]
      include_examples('model_shared_spec', :product_feedback, attributes)

      describe '#update_product_average_rating' do
        before(:each) do
          @product1 = create(:product)
          @product2 = create(:product)
          @user1 = create(:user)
          @user2 = create(:user)
          create(:product_feedback, product: @product2, user: @user1, product_rating: 4)
        end

        it 'updates the average rating of the associated product after creating a new feedback' do
          create(:product_feedback, product: @product1, user: @user1, product_rating: 5)
          create(:product_feedback, product: @product1, user: @user2, product_rating: 2)
          create(:product_feedback, product: @product2, user: @user2, product_rating: 2)
          expect(@product1.reload.average_rating).to eq ((5 + 2) / 2.0).to_f.round(2)
          expect(@product2.reload.average_rating).to eq ((2 + 4) / 2.0).to_f.round(2)
        end

        it 'updates the average rating of the associated product after updating a feedback' do
          product_feedback = create(:product_feedback, product: @product1, user: @user1, product_rating: 3)
          product_feedback.update(product_rating: 5)
          expect(@product1.reload.average_rating).to eq(5.0)
        end

        it 'updates the average rating of the associated product after deleting a feedback' do
          product_feedback = create(:product_feedback, product: @product2, user: @user2, product_rating: 2)
          product_feedback.destroy
          expect(@product2.reload.average_rating).to eq(4.0)
        end

        it 'validates uniqueness of user in the scope of the product' do
          duplicated_feedback = build(:product_feedback, product: @product2, user: @user1, product_rating: 4)
          expect(duplicated_feedback).not_to be_valid
          message = 'User You have already given feedback for this product'
          expect(duplicated_feedback.errors.full_messages).to include(message)
        end
      end
    end
  end
end
