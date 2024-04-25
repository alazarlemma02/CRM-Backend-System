require 'rails_helper'

RSpec.describe 'ProductFeedbacks', type: :request do
  include_examples('request_shared_spec', 'product_feedbacks', 5, [:index])

  let(:valid_attributes) do
    {
      feedback_content: Faker::Lorem.paragraph,
      feedback_datetime: Faker::Time.backward(days: 14),
      product_rating: Faker::Number.between(from: 0, to: 5),
      user_id: create(:user).id,
      product_id: create(:product).id
    }
  end

  let(:invalid_attributes) do
    {
      feedback_content: nil,
      feedback_datetime: Faker::Time.backward(days: 14),
      product_rating: Faker::Number.between(from: 0, to: 5),
      user_id: create(:user).id,
      product_id: create(:product).id
    }
  end

  let(:new_attributes) do
    {
      feedback_content: Faker::Lorem.word
    }
  end

  describe 'GET /api/v1/products/:product_id/product_feedbacks' do
    it 'returns product feedbacks for the specified product' do
      product = create(:product)
      count = Api::V1::ProductFeedback.where(product_id: product.id).count
      3.times { create(:product_feedback, product_id: product.id) }

      get(api_v1_product_feedbacks_url(product_id: product.id))
      expect(response).to be_successful
      result = JSON.parse(response.body)
      expect(result['success']).to be_truthy
      expect(result['data'].count).to eq(count + 3)
      expect(result['data'].all? { |feedback| feedback['product_id'] == product.id }).to be_truthy
    end
  end
end
