require 'rails_helper'

describe "Invoices API" do
  it "shows all invoices" do
    create_list(:invoice, 4)

    get "/api/v1/invoices"

    expect(response).to be_success

    invoices = JSON.parse(response.body)

    expect(invoices.count).to eq(4)
  end

  it "shows one invoice" do
    id = create(:invoice).id

    get "/api/v1/invoices/#{id}"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(id)
  end

  it "can find an invoice by id" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?id=#{invoice.id}"

    expect(response).to be_success
    content = JSON.parse(response.body)

    expect(content["id"]).to eq(invoice.id)
  end

  it "can find an invoice by customer id" do
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id)

    get "/api/v1/invoices/find?customerid=#{invoice.customer_id}"

    expect(response).to be_success
    content = JSON.parse(response.body)

    expect(content["customer_id"]).to eq(invoice.customer_id)
  end

  it "can find an invoice by merchant id" do
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id)

    get "/api/v1/invoices/find?merchantid=#{invoice.merchant_id}"

    expect(response).to be_success
    content = JSON.parse(response.body)

    expect(content["merchant_id"]).to eq(invoice.merchant_id)
  end

  it "can find an invoice by created date" do
    invoice = create(:invoice, created_at: DateTime.new(2015))

    get "/api/v1/invoices/find?createdat=#{invoice.created_at}"

    expect(response).to be_success
    content = JSON.parse(response.body)

    expect(content["status"]).to eq(invoice.status)
  end

  it "can find an invoice by updated date" do
    invoice = create(:invoice, updated_at: DateTime.new(2014))

    get "/api/v1/invoices/find?updatedat=#{invoice.updated_at}"

    expect(response).to be_success
    content = JSON.parse(response.body)

    expect(content["status"]).to eq(invoice.status)
  end

  it "can find an invoice by status" do
    invoice = create(:invoice, status: "success")

    get "/api/v1/invoices/find?status=#{invoice.status}"

    expect(response).to be_success
    content = JSON.parse(response.body)

    expect(content["status"]).to eq(invoice.status)
  end

  it "can find all invoices by merchant id" do
    merchant = create(:merchant)
    invoices = create_list(:invoice, 3, merchant_id: merchant.id)

    get "/api/v1/invoices/find_all?merchantid=#{invoices.first.merchant_id}"

    expect(response).to be_success
    content = JSON.parse(response.body)

    expect(content.first["merchant_id"]).to eq(invoices.first.merchant_id)
    expect(content.count).to eq(3)
  end

  it "can find all invoices by created date" do
    invoices = create_list(:invoice, 5, created_at: DateTime.new(2015))

    get "/api/v1/invoices/find_all?createdat=#{invoices.first.created_at}"

    expect(response).to be_success
    content = JSON.parse(response.body)

    expect(content.first["status"]).to eq(invoices.first.status)
    expect(content.count).to eq(5)
  end

  it "can find all invoices by updated date" do
    invoices = create_list(:invoice, 6, updated_at: DateTime.new(2014))

    get "/api/v1/invoices/find_all?updatedat=#{invoices.first.updated_at}"

    expect(response).to be_success
    content = JSON.parse(response.body)

    expect(content.first["status"]).to eq(invoices.first.status)
    expect(content.count).to eq(6)

  end

  it "can find all invoices by status" do
    invoices = create_list(:invoice, 4, status: "success")

    get "/api/v1/invoices/find_all?status=#{invoices.first.status}"

    expect(response).to be_success
    content = JSON.parse(response.body)

    expect(content.first["status"]).to eq(invoices.first.status)
  end
end
