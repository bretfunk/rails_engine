class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  def self.most_revenue(limit = 5)
    # ActiveRecord::Base.connection.execute(SELECT items.name, Sum(invoice_items.quantity * invoice_items.unit_price)
    # AS "Total Revenue" FROM items INNER JOIN invoice_items
    # ON items.id = invoice_items.id GROUP BY items.name
    # ORDER BY "Total Revenue";)
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

end
