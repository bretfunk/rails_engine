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
  it "can find by id" do
    customer = create(:customer)
    get "/api/v1/customers/find?id=#{customer.id}"
    expect(response).to be_success
    api_customer = JSON.parse(response.body)
    expect(api_customer["first_name"]).to eq(customer.first_name)
  end
  it "can find by first name" do
    customer = create(:customer)
    get "/api/v1/customers/find?first_name=#{customer.first_name}"
    expect(response).to be_success
    api_customer = JSON.parse(response.body)
    expect(api_customer["id"]).to eq(customer.id)
  end
  it "can find by last name" do
    customer = create(:customer)
    get "/api/v1/customers/find?last_name=#{customer.last_name}"
    expect(response).to be_success
    api_customer = JSON.parse(response.body)
    expect(api_customer["id"]).to eq(customer.id)
  end
  it "can find by created_at" do
    customer = create(:customer, created_at: DateTime.new(2001,2,3,4,5,6))
    get "/api/v1/customers/find?created_at=#{customer.created_at}"
    expect(response).to be_success
    api_customer = JSON.parse(response.body)
    expect(api_customer["first_name"]).to eq(customer.first_name)
  end
  it "can find by updated_at" do
    customer = create(:customer, updated_at: DateTime.new(2001,2,3,4,5,6))
    get "/api/v1/customers/find?updated_at=#{customer.updated_at}"
    expect(response).to be_success
    api_customer = JSON.parse(response.body)
    expect(api_customer["first_name"]).to eq(customer.first_name)
  end
  it "can find all by id" do
    customer = create(:customer)
    get "/api/v1/customers/find_all?id=#{customer.id}"
    expect(response).to be_success
    api_customer = JSON.parse(response.body)
    expect(api_customer[0]["first_name"]).to eq(customer.first_name)
  end
  it "can find all by first_name" do
    customer = create(:customer, first_name: "Same Name")
    create(:customer, first_name: "Same Name")
    create(:customer, first_name: "Same Name")
    get "/api/v1/customers/find_all?first_name=#{customer.first_name}"
    expect(response).to be_success
    api_customer = JSON.parse(response.body)
    expect(api_customer.count).to eq(3)
  end
  it "can find all by last_name" do
    customer = create(:customer, last_name: "Same Name")
    create(:customer, last_name: "Same Name")
    create(:customer, last_name: "Same Name")
    get "/api/v1/customers/find_all?last_name=#{customer.last_name}"
    expect(response).to be_success
    api_customer = JSON.parse(response.body)
    expect(api_customer.count).to eq(3)
  end
  it "can find all by created_at" do
    customer  = create(:customer, created_at: DateTime.new(2001,2,3,4,5,6))
    create(:customer, created_at: DateTime.new(2001,2,3,4,5,6))
    create(:customer, created_at: DateTime.new(2001,2,3,4,5,6))

    get "/api/v1/customers/find_all?created_at=#{customer.created_at}"

    expect(response).to be_success

    customers = JSON.parse(response.body)
    expect(customers.count).to eq(3)
  end
  it "can find all by updated_at" do
    customer  = create(:customer, updated_at: DateTime.new(2001,2,3,4,5,6))
    create(:customer, updated_at: DateTime.new(2001,2,3,4,5,6))
    create(:customer, updated_at: DateTime.new(2001,2,3,4,5,6))

    get "/api/v1/customers/find_all?updated_at=#{customer.updated_at}"

    expect(response).to be_success

    customers = JSON.parse(response.body)
    expect(customers.count).to eq(3)
  end
end
