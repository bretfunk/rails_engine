class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all, each_serializer: ItemSerializer
  end

  def show
    render json: Item.find(params[:id]), serializer: ItemSerializer
  end
end
