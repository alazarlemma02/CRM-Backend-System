# frozen_string_literal: true

# spec/requests/roles_spec.rb
require 'rails_helper'

RSpec.describe 'Roles', type: :request do
  include_examples('request_shared_spec', 'roles', 2)

  let(:valid_attributes) do
    {
      role_name: Faker::Lorem.word
    }
  end

  let(:invalid_attributes) do
    {
      role_name: nil
    }
  end

  let(:new_attributes) do
    {
      role_name: Faker::Lorem.word
    }
  end
end
