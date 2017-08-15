require 'rails_helper'

RSpec.describe "Invoice customer API", :type => :request  do
  it "can see an invoice's customer" do
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id)
    get "/api/v1/invoices/#{invoice.id}/customer"
    expect(response).to be_success
    content = JSON.parse(response.body)
    expect(content["id"]).to eq(customer.id)
  end
end
