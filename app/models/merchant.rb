class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices

  def favorite_customer
    self.customers.joins(invoices: :transactions).where(transactions: {result: "success"}).group('customers.id').order('count(customers.id) desc').first
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

  def self.all_merchants_revenue_by_quantity(limit=5)
    select("merchants.name, merchants.id, sum(quantity * unit_price) AS revenue")
    .joins(invoices: :invoice_items)
    .group(:id)
    .order("revenue DESC")
    .limit(limit)
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

  def self.all_merchants_revenue_by_date(date)
     Merchant.joins(invoices: [:invoice_items, :transactions])
     .where(transactions: { result: 'success'}, invoices: {created_at: "#{date}"})
     .sum("quantity * unit_price")
  end

  def self.pending_invoices(id)
    ActiveRecord::Base.connection.execute("
      SELECT DISTINCT customers.id, customers.first_name, customers.last_name
      FROM customers INNER JOIN invoices
      ON customers.id = invoices.customer_id
      INNER JOIN transactions ON transactions.invoice_id = invoices.id
      WHERE transactions.result='failed'
      AND invoices.merchant_id=#{id};")
    #self.customers.joins(invoices: :transactions).where(transactions: {result: "failure"})
  end
end
