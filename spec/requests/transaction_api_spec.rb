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
end
