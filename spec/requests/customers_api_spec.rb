require 'rails_helper'

RSpec.describe "Customer APIs" do
  it "shows all customers" do
    create_list(:customer, 5)
    get '/api/v1/customers'
    expect(response).to be_success

    customers = JSON.parse(response.body)
    expect(customers.count).to eq(5)
  end
  it "shows one customer" do
    id = create(:customer).id
    get "/api/v1/customers/#{id}"
    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
  end
end
