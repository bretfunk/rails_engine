class Api::V1::Merchants::BiRevenueController < ApplicationController

  def show
    render json: Merchant.revenue(params[:id])
  end
end
