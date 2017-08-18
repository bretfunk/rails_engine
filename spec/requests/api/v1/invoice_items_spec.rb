require 'rails_helper'

describe "Invoice Item API" do
  it "shows all invoice items" do
    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items"

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)
    expect(invoice_items.count).to eq(3)
  end

  it "shows one invoice item" do
    id = create(:invoice_item).id

    get "/api/v1/invoice_items/#{id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["id"]).to eq(id)
  end

  it "can find an invoice_item by id" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?id=#{invoice_item.id}"

    content = JSON.parse(response.body)

    expect(response).to be_success
    expect(content["id"]).to eq(invoice_item.id)
  end

  it "can find an invoice_item invoice by id" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?invoice_id=#{invoice_item.invoice_id}"

    content = JSON.parse(response.body)

    expect(response).to be_success
    expect(content["invoice_id"]).to eq(invoice_item.invoice_id)
  end

  it "can find an invoice_item item by id" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?item_id=#{invoice_item.item_id}"

    content = JSON.parse(response.body)

    expect(response).to be_success
    expect(content["item_id"]).to eq(invoice_item.item_id)
  end

  it "can find an invoice_item quantity" do
    invoice_item = create(:invoice_item)

    get "/api/v1/invoice_items/find?quantity=#{invoice_item.quantity}"

    content = JSON.parse(response.body)

    expect(response).to be_success
    expect(content["quantity"]).to eq(invoice_item.quantity)
  end


  it "can find an invoice_item created date" do
    invoice_item = create(:invoice_item, created_at: DateTime.new(2015))

    get "/api/v1/invoice_items/find?created_at=#{invoice_item.created_at}"

    content = JSON.parse(response.body)

    expect(response).to be_success
    expect(content["quantity"]).to eq(invoice_item.quantity)
  end

  it "can find an invoice_item updated date" do
    invoice_item = create(:invoice_item, updated_at: DateTime.new(2016))

    get "/api/v1/invoice_items/find?updated_at=#{invoice_item.updated_at}"

    content = JSON.parse(response.body)

    expect(response).to be_success
    expect(content["quantity"]).to eq(invoice_item.quantity)
  end

  it "can find all invoice_item by id" do
    invoice_items = create_list(:invoice_item, 4)

    get "/api/v1/invoice_items/find_all?id=#{invoice_items.first.id}"

    content = JSON.parse(response.body)

    expect(response).to be_success
    expect(content.first["id"]).to eq(invoice_items.first.id)
    expect(content.count).to eq(4)
  end

  it "can find all invoice_item invoices by id" do
    invoice = create(:invoice)
    invoice_items = create_list(:invoice_item, 5, invoice_id: invoice.id)

    get "/api/v1/invoice_items/find_all?invoice_id=#{invoice_items.first.invoice_id}"

    expect(response).to be_success
    content = JSON.parse(response.body)

    expect(content.first["invoice_id"]).to eq(invoice_items.first.invoice_id)
    expect(content.count).to eq(5)

  end

  it "can find all invoice_item items by id" do
    item = create(:item)
    invoice_items = create_list(:invoice_item, 7, item_id: item.id)

    get "/api/v1/invoice_items/find_all?item_id=#{invoice_items.first.item_id}"

    content = JSON.parse(response.body)

    expect(response).to be_success
    expect(content.first["item_id"]).to eq(invoice_items.first.item_id)
    expect(content.count).to eq(7)

  end

  it "can find all invoice_item quantity" do
    invoice_items = create_list(:invoice_item, 4)

    get "/api/v1/invoice_items/find_all?quantity=#{invoice_items.last.quantity}"

    content = JSON.parse(response.body)

    expect(response).to be_success
    expect(content.last["quantity"]).to eq(invoice_items.last.quantity)
    expect(content.count).to eq(4)

  end


  it "can find all invoice_item created date" do
    invoice_items = create_list(:invoice_item, 4, created_at: DateTime.new(2015))

    get "/api/v1/invoice_items/find_all?created_at=#{invoice_items.first.created_at}"

    content = JSON.parse(response.body)

    expect(response).to be_success
    expect(content.first["quantity"]).to eq(invoice_items.first.quantity)
    expect(content.count).to eq(4)

  end

  it "can find all invoice_item updated date" do
    invoice_item = create_list(:invoice_item, 5,updated_at: DateTime.new(2016))

    get "/api/v1/invoice_items/find_all?updated_at=#{invoice_item.first.updated_at}"

    content = JSON.parse(response.body)

    expect(response).to be_success
    expect(content.first["quantity"]).to eq(invoice_item.first.quantity)
    expect(content.count).to eq(5)
  end
end
