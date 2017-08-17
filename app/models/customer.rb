class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices

  # GET /api/v1/customers/:id/favorite_merchant
  # returns a merchant where the customer has conducted
  # the most successful transactions
  #
  # def self.favorite_merchant
  #   SELECT merchants.name, count(merchants.name) FROM customers
  #   INNER JOIN invoices ON customers.id = invoices.customer_id
  #   INNER JOIN merchants ON merchants.id = invoices.merchant_id
  #   INNER JOIN transactions ON invoices.id = transactions.invoice_id
  #   WHERE transactions.result = 'success' GROUP BY merchants.name;
  # end

end
