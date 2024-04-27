FactoryBot.define do
  factory :notification, class: 'Api::V1::Notification' do
    user
    message
  end
end
