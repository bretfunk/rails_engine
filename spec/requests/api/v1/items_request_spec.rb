require 'rails_helper'

describe "Items API" do
  it "shows all items" do
    create_list(:item, 5)

    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(5)
  end

  it "shows one item" do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(id)
  end
end
