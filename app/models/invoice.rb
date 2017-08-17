class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.most_expensive(limit=5)
    select("invoices.id, sum(invoice_items.unit_price * invoice_items.quantity) AS totes_rev")
    .joins(:invoice_items, :transactions)
    .merge(Transaction.successful)
    .group("invoices.id")
    .order("totes_rev DESC")
    .limit(limit)
  end

end
