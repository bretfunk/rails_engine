class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices

  def self.favorite_merchant(id)
    ActiveRecord::Base.connection.execute("
    SELECT merchants.id, merchants.name FROM customers
    INNER JOIN invoices ON customers.id = invoices.customer_id
    INNER JOIN merchants ON merchants.id = invoices.merchant_id
    INNER JOIN transactions ON invoices.id = transactions.invoice_id
    WHERE transactions.result = 'success' AND invoices.customer_id = #{id}
    GROUP BY merchants.id, merchants.name ORDER BY count(merchants.name) LIMIT 1;").to_a
   end

end
