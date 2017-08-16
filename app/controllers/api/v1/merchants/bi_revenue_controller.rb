class Api::V1::Merchants::BiRevenueController
  def index
   #SELECT merchants.name, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue FROM merchants INNER JOIN invoices ON merchants.id = invoices.merchant_id INNER JOIN invoice_items ON invoices.id = invoice_items.invoice_id GROUP BY merchants.name LIMIT ?;
  end
end
