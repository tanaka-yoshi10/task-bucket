FactoryBot.define do
  factory :project do
    name { '仕事' }
    association :user
  end
end
