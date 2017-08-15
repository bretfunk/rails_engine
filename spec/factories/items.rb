FactoryGirl.define do
  factory :item do
    name "DVD"
    description "Nihil autem sit odio inventore deleniti."
    unit_price 75107
    merchant
    created_at 2.weeks.ago
    updated_at 1.week.ago
  end
end
