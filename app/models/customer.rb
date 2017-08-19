class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices

  def self.favorite_merchant(customer_id)
      find_by(id: customer_id).merchants.select("merchants.*, count(transactions.id) AS transaction_count")
      .joins(invoices: :transactions)
      .where(transactions: {result: "success"})
      .group('merchants.id')
      .order('transaction_count desc').first
    #ActiveRecord::Base.connection.execute("
    #SELECT merchants.id, merchants.name FROM customers
    #INNER JOIN invoices ON customers.id = invoices.customer_id
    #INNER JOIN merchants ON merchants.id = invoices.merchant_id
    #INNER JOIN transactions ON invoices.id = transactions.invoice_id
    #WHERE transactions.result = 'success' AND invoices.customer_id = {id}")
   end

end
