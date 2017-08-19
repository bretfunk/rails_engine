require 'rails_helper'

describe "Items Business Intel", type: :request do
  it "returns the top items ranked by most revenue" do

    item_1 = create(:item)
    item_2 = create(:item)

    invoice_item_1 = create(:invoice_item, quantity: 5, item_id: item_1.id)
    invoice_item_2 = create(:invoice_item, quantity: 3, item_id: item_1.id)
    invoice_item_3 = create(:invoice_item, quantity: 1, item_id: item_2.id)

    get "/api/v1/items/most_revenue?quantity=2"

    expect(response).to be_success

    content = JSON.parse(response.body)

    expect(content.count).to eq(2)
    expect(content.first["name"]).to eq(item_1.name)
    expect(content.first["id"]).to eq(item_1.id)
    expect(content.last["id"]).not_to eq(item_2)
  end

end
