class Api::V1::Merchants::BiItemsSoldController < ApplicationController

  def index
    ActiveRecord::Base.connection.execute("SELECT merchants.name, SUM(invoice_items.quantity) AS items_sold FROM merchants INNER JOIN invoices ON merchants.id = invoices.merchant_id INNER JOIN invoice_items ON invoices.id = invoice_items.invoice_id GROUP BY merchants.name LIMIT 5;")
  end
end
