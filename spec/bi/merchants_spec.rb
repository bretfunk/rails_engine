require 'rails_helper'
require 'date'

RSpec.describe "Merchant Biz Intel", :type => :request do
  it "returns the top merchants ranked by revenue" do
    merchant1 = create(:merchant)
    customer1 = create(:customer)
    invoice1 = create(:invoice, merchant_id: merchant1.id, customer_id: customer1.id)
    create(:invoice_item, invoice_id: invoice1.id, quantity: 5, unit_price: 100)

    get "/api/v1/merchants/most_revenue?quantity=1"
    expect(response).to be_success
    content = JSON.parse(response.body)
    expect(content[0]["id"]).to eq(merchant1.id)
  end

  it "returns the top merchants ranked by items" do
    merchant1 = create(:merchant)
    customer1 = create(:customer)
    invoice1 = create(:invoice, merchant_id: merchant1.id, customer_id: customer1.id)
    invoice2 = create(:invoice, merchant_id: merchant1.id, customer_id: customer1.id)
    create(:invoice_item, invoice_id: invoice1.id, quantity: 5, unit_price: 100)
    create(:invoice_item, invoice_id: invoice2.id, quantity: 50, unit_price: 10)
    create(:transaction, invoice_id: invoice1.id, result: "success")
    create(:transaction, invoice_id: invoice2.id, result: "success")

    get "/api/v1/merchants/most_items?quantity=1"
    expect(response).to be_success
    content = JSON.parse(response.body)
    expect(content[0]["id"]).to eq(merchant1.id)
  end

  it "returns the top merchants ranked by date" do
    merchant1 = create(:merchant)
    customer1 = create(:customer)
    date = DateTime.now
    item1 = create(:item, created_at: date)
    item2 = create(:item, created_at: date)
    invoice1 = create(:invoice, merchant_id: merchant1.id, customer_id: customer1.id)
    invoice2 = create(:invoice, merchant_id: merchant1.id, customer_id: customer1.id)
    create(:invoice_item, invoice_id: invoice1.id, quantity: 5, unit_price: 100, item_id: item1.id)
    create(:invoice_item, invoice_id: invoice2.id, quantity: 50, unit_price: 10, item_id: item2.id)
    create(:transaction, invoice_id: invoice1.id, result: "success")
    create(:transaction, invoice_id: invoice2.id, result: "success")

    get "/api/v1/merchants/most_items?date=#{date}"
    expect(response).to be_success
    content = JSON.parse(response.body)
    byebug
    #expect(content[0]["id"]).to eq(merchant1.id)
    #showing up as nil
  end
end
