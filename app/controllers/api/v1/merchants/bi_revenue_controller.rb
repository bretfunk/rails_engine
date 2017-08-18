class Api::V1::Merchants::BiRevenueController < ApplicationController

  def show
    if params[:date].nil?
      render json: Merchant.most_revenue_for_one_merchant(params[:id]), each_serializer: MostRevenueAllMerchantsSerializer
    else
      render json: Merchant.revenue_by_date(params[:id], params[:date]), each_serializer: MostRevenueAllMerchantsSerializer

    end
  end
end
