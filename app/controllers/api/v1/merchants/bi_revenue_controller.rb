class Api::V1::BiRevenueController < ApplicationController

  def show
   "SELECT merchants.name, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue FROM merchants INNER JOIN invoices ON merchants.id = invoices.merchant_id INNER JOIN invoice_items ON invoice_items.invoice_id = invoices.id INNER JOIN transactions ON transactions.invoice_id = invoices.id WHERE transactions.result='success'AND merchants.id=1 GROUP BY merchants.name;"
   #need to add merch id from params
  end
end
