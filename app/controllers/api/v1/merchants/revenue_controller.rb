class Api::V1::Merchants::MostRevenueController < ApplicationController

  def index
    if date.nil?
      render json: Mercant.revenue(params[:id])
    else
      render json: Mercant.revenue_by_date(params[:id], params[:date])
    end
  end

end
