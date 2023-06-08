FactoryBot.define do
  factory :history do
    type { "post_created" }
    user { "John Doe" }
    created_at { Date.today }
  end
end
