require "rails_helper"

RSpec.describe "Transaction APIs" do
  it "Shows all transactions" do
    create_list(:transaction, 5)
    get '/api/v1/transactions'
    expect(response).to be_success

    transactions = JSON.parse(response.body)
    expect(transactions.count).to eq(5)
  end

  it "Shows a transaction" do
    id = create(:transaction).id
    get "/api/v1/transactions/#{id}"
    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["id"]).to eq(id)
  end
  it "can find by id" do
    transaction = create(:transaction)
    get "/api/v1/transactions/find?id=#{transaction.id}"
    expect(response).to be_success
    transaction_api = JSON.parse(response.body)
    expect(transaction_api["id"]).to eq(transaction.id)
  end
  it "can find by invoice_id" do
    transaction = create(:transaction)
    get "/api/v1/transactions/find?invoice_id=#{transaction.invoice_id}"
    expect(response).to be_success
    transaction_api = JSON.parse(response.body)
    expect(transaction_api["id"]).to eq(transaction.id)
  end
  it "can find by credit_card_number" do
    transaction = create(:transaction)
    get "/api/v1/transactions/find?credit_card_number=#{transaction.credit_card_number}"
    expect(response).to be_success
    transaction_api = JSON.parse(response.body)
    expect(transaction_api["id"]).to eq(transaction.id)
  end
  it "can find by result" do
    transaction = create(:transaction)
    get "/api/v1/transactions/find?result=#{transaction.result}"
    expect(response).to be_success
    transaction_api = JSON.parse(response.body)
    expect(transaction_api["id"]).to eq(transaction.id)
  end
  it "can find by created_at" do
    transaction = create(:transaction, created_at: DateTime.new(2001,2,3,4,5,6))
    get "/api/v1/transactions/find?created_at=#{transaction.created_at}"
    expect(response).to be_success
    transaction_api = JSON.parse(response.body)
    expect(transaction_api["id"]).to eq(transaction.id)
  end
  it "can find by updated_at" do
    transaction = create(:transaction, updated_at: DateTime.new(2001,2,3,4,5,6))
    get "/api/v1/transactions/find?updated_at=#{transaction.updated_at}"
    expect(response).to be_success
    transaction_api = JSON.parse(response.body)
    expect(transaction_api["id"]).to eq(transaction.id)
  end
  it "can find all by id" do
    transaction = create(:transaction)
    get "/api/v1/transactions/find_all?id=#{transaction.id}"
    expect(response).to be_success
    transaction_api = JSON.parse(response.body)
    expect(transaction_api[0]["id"]).to eq(transaction.id)
  end
  it "can find all by invoice_id" do
    transaction = create(:transaction)
    create(:transaction, invoice_id: transaction.invoice_id)
    create(:transaction, invoice_id: transaction.invoice_id)
    get "/api/v1/transactions/find_all?invoice_id=#{transaction.invoice_id}"
    expect(response).to be_success
    transaction_api = JSON.parse(response.body)
    expect(transaction_api.count).to eq(3)
  end
  it "can find all by credit_card_number" do
    transaction = create(:transaction)
    create(:transaction, credit_card_number: transaction.credit_card_number)
    create(:transaction, credit_card_number: transaction.credit_card_number)
    get "/api/v1/transactions/find_all?credit_card_number=#{transaction.credit_card_number}"
    expect(response).to be_success
    transaction_api = JSON.parse(response.body)
    expect(transaction_api.count).to eq(3)
  end
  it "can find all by result" do
    transaction = create(:transaction)
    create(:transaction, result: transaction.result)
    create(:transaction, result: transaction.result)
    get "/api/v1/transactions/find_all?result=#{transaction.result}"
    expect(response).to be_success
    transaction_api = JSON.parse(response.body)
    expect(transaction_api.count).to eq(3)
  end
  it "can find all by created_at" do
    transaction = create(:transaction, created_at: DateTime.new(2001,2,3,4,5,6))
    create(:transaction, created_at: transaction.created_at)
    create(:transaction, created_at: transaction.created_at)
    get "/api/v1/transactions/find_all?created_at=#{transaction.created_at}"
    expect(response).to be_success
    transaction_api = JSON.parse(response.body)
    expect(transaction_api.count).to eq(3)
  end
  it "can find all by updated_at" do
    transaction = create(:transaction, updated_at: DateTime.new(2001,2,3,4,5,6))
    create(:transaction, updated_at: transaction.updated_at)
    create(:transaction, updated_at: transaction.updated_at)
    get "/api/v1/transactions/find_all?updated_at=#{transaction.updated_at}"
    expect(response).to be_success
    transaction_api = JSON.parse(response.body)
    expect(transaction_api.count).to eq(3)
  end
end
