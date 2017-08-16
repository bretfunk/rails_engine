require 'rails_helper'

describe "Customer Transactions API", type: :request do
  it "can show transactions for a single customer" do
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id)
    transactions = create(:transaction, invoice_id: invoice.id)

    get "/api/v1/customers/#{customer.id}/transactions"

    expect(response).to be_success
    content = JSON.parse(response.body)
    expect(content.count).to eq(1)

  end
end
