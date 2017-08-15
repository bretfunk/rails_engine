require 'rails_helper'

describe "Invoices API" do
  it "shows all invoices" do
    create_list(:invoice, 4)

    get "/api/v1/invoices"

    expect(response).to be_success

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(4)
  end

  it "shows one invoice" do
    id = create(:invoice).id

    get "/api/v1/invoices/#{id}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(id)
  end
end
