require 'rails_helper'

describe "Merchant Invoices API", type: :request do
  it "can show invoices for a single merchant" do
    merchant = create(:merchant)
    invoices = create_list(:invoice, 8, merchant_id: merchant.id)

    get "/api/v1/merchants/#{merchant.id}/invoices"

    expect(response).to be_success

    content = JSON.parse(response.body)

    expect(content.count).to eq(8)
  end
end
