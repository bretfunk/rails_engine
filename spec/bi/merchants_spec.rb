# require 'rails_helper'
#
# RSpec.describe "Biz Intel", :type => :request do
#   it "returns the top merchants ranked by revenue" do
#     create_list(:merchant, 3)
#     get "/api/v1/merchants/most_revenue?quantity=3"
#     expect(response).to be_success
#     merchants = JSON.parse(response.body)
#     expect(merchants.count).to eq(3)
#   end
# end
