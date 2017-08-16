require 'rails_helper'

describe "Customer Invoices API", type: :request do
  it "can show invoices for a single customer" do
    customer = create(:customer)
    invoices = create_list(:invoice, 3, customer_id: customer.id)

    get "/api/v1/customers/#{customer.id}/invoices"

    expect(response).to be_success
    content = JSON.parse(response.body)
    expect(content.count).to eq(3)

  end
end
