require 'rails_helper'

RSpec.describe "Invoice invoice_items API", :type => :request  do
  it "can see an invoice's invoice_items" do
    invoice = create(:invoice)
    invoice_items = create(:invoice_item, invoice_id: invoice.id)
    get "/api/v1/invoices/#{invoice.id}/invoice_items"
    expect(response).to be_success
    content = JSON.parse(response.body)
    expect(content[0]["id"]).to eq(invoice_items.id)
  end
end
