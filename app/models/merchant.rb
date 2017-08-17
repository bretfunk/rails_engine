class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices

  def self.favorite_customer(id)
    ActiveRecord::Base.connection.execute("SELECT customers.first_name, customers.last_name, count(transactions.id) FROM merchants
    INNER JOIN invoices ON merchants.id = invoices.merchant_id
    INNER JOIN customers ON customers.id = invoices.customer_id
    INNER JOIN transactions ON transactions.invoice_id = invoices.id AND merchants.id =
    WHERE transactions.result = 'success' #{id} GROUP BY customers.first_name, customers.last_name
    ORDER BY COUNT(transactions.id) DESC;")
  end

  def self.most_items_sold(limit=5)
    ActiveRecord::Base.connection.execute("
    SELECT merchants.name, SUM(invoice_items.quantity)
    AS items_sold FROM merchants
    INNER JOIN invoices ON merchants.id = invoices.merchant_id
    INNER JOIN invoice_items ON invoices.id = invoice_items.invoice_id
    GROUP BY merchants.name
    ORDER BY items_sold
    DESC LIMIT #{limit};").to_a
  end

  def self.most_revenue_for_all_merchants
    #ActiveRecord::Base.connection.execute("
    #SELECT merchants.name,
    #SUM(invoice_items.unit_price * invoice_items.quantity)
    #AS revenue FROM merchants
    #INNER JOIN invoices ON merchants.id = invoices.merchant_id
    #INNER JOIN invoice_items ON invoices.id = invoice_items.invoice_id
    #GROUP BY merchants.name LIMIT 5;").to_a
    #select("merchants.name").joins(invoices: :invoice_items)
    #group("name")
    select("merchants.name, sum(quantity * unit_price) AS revenue")
    .joins(invoices: :invoice_items)
    .group(:id)
    .order("revenue DESC")
  end
  
  def self.most_revenue_for_one_merchant(id = 1)
    select("merchants.name").joins(invoices: [:invoice_items, :transactions])
    .where(transactions: { result: 'success'}, merchants: { id: "#{id}" })
    .group("merchants.name").sum("quantity * unit_price")
  end

  def self.revenue_by_date(id, date)
     Merchant.joins(invoices: [:invoice_items, :transactions])
     .where(transactions: { result: 'success'}, merchants: { id: "#{id}"}, invoices: {created_at: "#{date}"})
     .group("merchants.name").sum("quantity * unit_price")
  end

  def self.all_revenue_by_date(date)
     Merchant.joins(invoices: [:invoice_items, :transactions])
     .where(transactions: { result: 'success'}, invoices: {created_at: "#{date}"})
     .sum("quantity * unit_price")
  end
end
