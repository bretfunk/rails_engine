require 'rails_helper'
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
end
