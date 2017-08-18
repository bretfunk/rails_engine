class Api::V1::Items::BiMostItemsController < ApplicationController

  def show
    if params[:quantity].nil?
      render json: Item.most_items(5)
    else
    render json: Item.most_items(params[:quantity])
    end
  end
end
