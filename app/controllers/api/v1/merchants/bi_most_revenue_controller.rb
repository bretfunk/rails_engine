class Api::V1::Merchants::BiMostRevenueController < ApplicationController
  def index
   render json: Merchant.most_revenue_for_all_merchants(params[:quantity])#, each_serializer: MostRevenueAllMerchantsSerializer
  end
end
