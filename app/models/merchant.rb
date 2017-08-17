class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices

  # GET /api/v1/merchants/:id/favorite_customer returns the customer who has
  # conducted the most total number of successful transactions.

  # SELECT customers.first_name, customers.last_name, count(invoices.first_name)
  # FROM merchants INNER JOIN invoices ON merchants.id = invoices.merchant_id
  # INNER JOIN customers ON customers.id = invoices.customer_id
  # INNER JOIN transactions ON invoices.id = transactions.invoice_id
  # WHERE transactions.result = 'success'
  # GROUP BY customers.first_name, customers.last_name
  # ORDER BY count(customers.first_name) DESC;

  def favorite_customer

  end

  # GET /api/v1/merchants/:id/revenue?date=x returns the total revenue for that
  # merchant for a specific invoice date x


  def revenue(date)

  end
end
