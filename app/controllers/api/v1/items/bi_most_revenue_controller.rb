class Api::V1::Items::BiMostRevenueController < ApplicationController

  def show
    render json: Item.most_revenue(limit = 5)
  end
end
