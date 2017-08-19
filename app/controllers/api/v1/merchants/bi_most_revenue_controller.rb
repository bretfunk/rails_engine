class Api::V1::Merchants::BiMostRevenueController < ApplicationController

  def index
   render json: Merchant.all_merchants_revenue_by_quantity(params[:quantity])
  end
end
