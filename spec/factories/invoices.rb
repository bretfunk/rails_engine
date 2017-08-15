FactoryGirl.define do
  factory :invoice do
    status "shipped"
    customer
    merchant
    created_at 2.weeks.ago
    updated_at 1.week.ago
  end
end
