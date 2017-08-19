class Api::V1::Merchants::BiAllRevenueController < ApplicationController

  def index
    if params[:date].nil?
    render json: Merchant.most_revenue_for_all_merchants, serializer: TotalRevenueSerializer
    else
    render json: Merchant.all_merchants_revenue_by_date(params[:date]), serializer: TotalRevenueSerializer

    end
  end
end
