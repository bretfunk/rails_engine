require 'rails_helper'

describe "Merchant Items API", type: :request do
  it "can show items for a single merchant" do
    merchant = create(:merchant)
    items = create_list(:item, 5)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_success
    content = JSON.parse(response.body)
    expect(content.count).to eq(5)
  end
end
