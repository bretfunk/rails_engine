require "rails_helper"
    #t.bigint "invoice_id"
    #t.bigint "credit_card_number"
    #t.string "result"
    #t.datetime "created_at"
    #t.datetime "updated_at"
    #t.index ["invoice_id"], name: "index_transactions_on_invoice_id"

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
end
