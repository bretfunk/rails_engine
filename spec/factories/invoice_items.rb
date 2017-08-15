FactoryGirl.define do
  factory :invoice_item do
    quantity 5
    unit_price 13635
    item
    invoice
    created_at 2.weeks.ago
    updated_at 1.week.ago
  end
end
