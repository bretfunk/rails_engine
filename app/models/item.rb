class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  def self.most_revenue(limit = 5)
    select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
    .joins(:invoice_items)
    .group("items.id")
    .order("total_revenue DESC")
    .limit(limit)
  end

  def self.most_items(limit = 5)
    select("items.*, sum(invoice_items.quantity) AS most_items_sold")
    .joins(:invoice_items)
    .group("items.id, items.name")
    .order("most_items_sold DESC")
    .limit(limit)
  end

  def self.best_day(id)
    ActiveRecord::Base.connection.execute("
      SELECT invoices.created_at AS best_day
      FROM invoices INNER JOIN invoice_items ON invoices.id = invoice_items.invoice_id
      WHERE invoice_items.item_id= #{id}
      GROUP BY invoices.created_at, invoice_items.item_id, invoice_items.quantity
      ORDER BY invoice_items.quantity DESC LIMIT 1;")
  end
end
