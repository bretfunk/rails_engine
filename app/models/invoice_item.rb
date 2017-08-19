class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  #validates_numericality_of :item, :unit_price
end
