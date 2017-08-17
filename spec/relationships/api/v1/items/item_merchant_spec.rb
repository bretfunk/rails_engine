require 'rails_helper'

RSpec.describe "Item merchant API", :type => :request do
  it "finds the items merchant" do
    item = create(:item)
    get "/api/v1/items/#{item.id}/merchant"
    expect(response).to be_success
    content = JSON.parse(response.body)
    expect(content["name"]).to eq(item.merchant.name)
  end
end
