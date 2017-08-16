require 'rails_helper'

RSpec.describe "Item invoice items API", :type => :request do
  it "can see the invoice items of an item" do
    item = create(:item)
    create(:invoice_item, item_id: item.id)
    create(:invoice_item, item_id: item.id)
    create(:invoice_item, item_id: item.id)
    get "/api/v1/items/#{item.id}/invoice_items"
    expect(response).to be_success
    content = JSON.parse(response.body)
    expect(content.count).to eq(3)
  end
end
