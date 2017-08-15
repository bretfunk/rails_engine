require 'rails_helper'

RSpec.describe "Invoice merchant API", :type => :request  do
  it "can see an invoice's merchant" do
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id)
    get "/api/v1/invoices/#{invoice.id}/merchant"
    expect(response).to be_success
    content = JSON.parse(response.body)
    expect(content.count).to eq(1)
  end
end
