class Api::V1::Items::BiMostItemsController < ApplicationController

  def show
    render json: Item.most_items(limit = 5)
  end
end
