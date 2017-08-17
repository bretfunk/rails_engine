require 'rails_helper'

describe "Transaction Invoice API", type: :request do
  it "can show the invoice for a transaction" do
    invoice = create(:invoice)
    transaction = create(:transaction, invoice_id: invoice.id)

    get "/api/v1/transactions/#{transaction.id}/invoices"

    expect(response).to be_success
    content = JSON.parse(response.body)
    expect(content["id"]).to eq(invoice.id)
  end
end
