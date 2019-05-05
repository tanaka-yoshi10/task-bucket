FactoryBot.define do
  factory :user do
    sequence(:email) { |index| "test-#{index}@example.com" }
    password { 'please123' }
  end
end
