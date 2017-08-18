class Api::V1::Items::BiMostRevenueController < ApplicationController

  def show
    if params[:quantity].nil?
      render json: Item.most_revenue(5)
    else
    render json: Item.most_revenue(params[:quantity])
    end
  end
end
