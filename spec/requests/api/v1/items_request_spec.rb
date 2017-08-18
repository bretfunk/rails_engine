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

  it "can find by id" do
    item = create(:item)

    get "/api/v1/items/find?id=#{item.id}"

    expect(response).to be_success
    content = JSON.parse(response.body)
    expect(content["id"]).to eq(item.id)
  end

  it "can find by name" do
    item = create(:item)

    get "/api/v1/items/find?name=#{item.name}"

    expect(response).to be_success
    content = JSON.parse(response.body)
    expect(content["name"]).to eq(item.name)
  end

  it "can find by unit price" do
    item = create(:item)

    get "/api/v1/items/find?unitprice=#{item.unit_price}"

    expect(response).to be_success
    content = JSON.parse(response.body)
  end

  it "can find by merchant id" do
    item = create(:item)

    get "/api/v1/items/find?merchantid=#{item.merchant_id}"

    expect(response).to be_success
    content = JSON.parse(response.body)
    expect(content["merchant_id"]).to eq(item.merchant_id)
  end

  it "can find by created at" do
    item = create(:item, created_at:  DateTime.new(2016))

    get "/api/v1/items/find?merchantid=#{item.created_at}"

    expect(response).to be_success
    content = JSON.parse(response.body)
    expect(content["name"]).to eq(item.name)
  end

  it "can find by updated at" do
    item = create(:item, updated_at:  DateTime.new(2016))

    get "/api/v1/items/find?merchantid=#{item.created_at}"

    expect(response).to be_success
    content = JSON.parse(response.body)
    expect(content["name"]).to eq(item.name)
  end

  it "can find all items by name" do
    items = create_list(:item, 4, name: "Item with same name")

    get "/api/v1/items/find_all?item=#{items.first.name}"

    expect(response).to be_success
    content = JSON.parse(response.body)
    expect(content.count).to eq(4)
    expect(content.first["name"]).to eq(items.first.name)
  end

  it "can find all items by merchant id" do
    merchant = create(:merchant)
    items = create_list(:item, 3, merchant_id: merchant.id)

    get "/api/v1/items/find_all?item=#{items.first.merchant_id}"

    expect(response).to be_success
    content = JSON.parse(response.body)
    expect(content.count).to eq(3)
    expect(content.first["merchant_id"]).to eq(items.first.merchant_id)
  end

  it "can find all items by created date" do
    items = create_list(:item, 6, created_at: DateTime.new(2015))

    get "/api/v1/items/find_all?item=#{items.first.created_at}"

    expect(response).to be_success
    content = JSON.parse(response.body)
    expect(content.count).to eq(6)
    expect(content.first["name"]).to eq(items.first.name)
  end

  it "can find all items by updated date" do
    items = create_list(:item, 6, updated_at: DateTime.new(2015))

    get "/api/v1/items/find_all?item=#{items.first.updated_at}"

    expect(response).to be_success
    content = JSON.parse(response.body)
    expect(content.count).to eq(6)
    expect(content.first["name"]).to eq(items.first.name)
  end


end
