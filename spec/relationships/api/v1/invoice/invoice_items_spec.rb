require 'rails_helper'

RSpec.describe "Invoice Items API", :type => :request do
  it "shows items for an invoice" do
    invoice = create(:invoice)
    create_list(:invoice_item, 5, invoice_id: invoice.id)
    get "/api/v1/invoices/#{invoice.id}/items"
    expect(response).to be_success
    content = JSON.parse(response.body)
    expect(content.count).to eq(5)
  end
end
