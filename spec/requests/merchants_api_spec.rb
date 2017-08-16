require 'rails_helper'
require 'date'
RSpec.describe "Merchant API" do
  it "shows all merchants" do
    create_list(:merchant, 5)
    get '/api/v1/merchants'
    expect(response).to be_success

    merchants = JSON.parse(response.body)
    expect(merchants.count).to eq(5)
  end
  it "shows a merchant" do
    id = create(:merchant).id
    get "/api/v1/merchants/#{id}"
    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["id"]).to eq(id)

  end
  it "can find by name" do
    merchant = create(:merchant)
    get "/api/v1/merchants/find?name=#{merchant.name}"
    expect(response).to be_success
    api_merchant = JSON.parse(response.body)
    expect(api_merchant["id"]).to eq(merchant.id)
  end
  it "can find by id" do
    merchant = create(:merchant)
    get "/api/v1/merchants/find?id=#{merchant.id}"
    expect(response).to be_success
    api_merchant = JSON.parse(response.body)
    expect(api_merchant["name"]).to eq(merchant.name)
  end
  it "can find by created_at" do
    merchant = create(:merchant, created_at: DateTime.new(2001,2,3,4,5,6))
    get "/api/v1/merchants/find?created_at=#{merchant.created_at}"
    expect(response).to be_success
    api_merchant = JSON.parse(response.body)
    expect(api_merchant["name"]).to eq(merchant.name)
  end
  it "can find by updated_at" do
    merchant = create(:merchant, updated_at: DateTime.new(2001,2,3,4,5,6))
    get "/api/v1/merchants/find?updated_at=#{merchant.updated_at}"
    expect(response).to be_success
    api_merchant = JSON.parse(response.body)
    expect(api_merchant["name"]).to eq(merchant.name)
  end
end
