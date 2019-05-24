FactoryBot.define do
  factory :task do
    title { 'なんかやる' }
    association :user
  end
end
