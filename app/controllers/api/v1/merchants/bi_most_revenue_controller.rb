class Api::V1::Merchants::BiMostRevenueController < ApplicationController
  def index
   render json: Merchant.most_revenue
  end
end
