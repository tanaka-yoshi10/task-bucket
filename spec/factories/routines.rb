FactoryBot.define do
  factory :routine do
    recurrence { "MyString" }
    title { "MyString" }
    estimate { 1 }
    project { nil }
    user { nil }
  end
end
