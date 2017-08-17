class Merchant < ApplicationRecord
  has_many :invoices
  has_many :items
  has_many :invoice_items, through: :invoices
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

  def self.most_revenue
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
  def self.revenue(id=1)
    #ActiveRecord::Base.connection.execute("
    #SELECT merchants.name,
    #SUM(invoice_items.unit_price * invoice_items.quantity)
    #AS revenue FROM merchants
    #INNER JOIN invoices ON merchants.id = invoices.merchant_id
    #INNER JOIN invoice_items ON invoice_items.invoice_id = invoices.id
    #INNER JOIN transactions ON transactions.invoice_id = invoices.id
    #WHERE transactions.result='success'AND merchants.id=#{id}
    #GROUP BY merchants.name;")
    select("merchants.name").joins(invoices: :invoice_items).joins(invoices: :transactions)
    .where(transactions: { result: 'success' }, merchants: {id: "#{id}" })
    .group("merchants.name").sum("quantity * unit_price")
  end

  def self.revenue(id)
   #Merchant.select("merchants.name, sum(invoice_items.unti_price * invoice_items.quantity) AS revenue")
   #.joins(:invoices, :invoice_items, :transactions).where(transactions: {result= 'success'}, merchants: {id = "#{id}"})
   #.group("merchants.name)

  end

  def favorite_customer

  end
end
