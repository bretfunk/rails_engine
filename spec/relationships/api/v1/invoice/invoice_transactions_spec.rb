require 'rails_helper'

RSpec.describe "Invoice transactions API", :type => :request  do
  it "can see an invoice's transactions" do
    invoice = create(:invoice)
    create_list(:transaction, 3, invoice_id: invoice.id)
    #create(:transaction, invoice_id: invoice.id)
    #create(:transaction, invoice_id: invoice.id)
    #create(:transaction, invoice_id: invoice.id)
    get "/api/v1/invoices/#{invoice.id}/transactions"
    expect(response).to be_success
    content = JSON.parse(response.body)
    expect(content.count).to eq(3)
  end
end
