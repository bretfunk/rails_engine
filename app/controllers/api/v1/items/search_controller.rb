class Api::V1::Items::SearchController < ApplicationController
  before_action :price_sanitizer

  def index
    render json: Item.where(item_params)
  end

  def show
    render json: Item.find_by(item_params)
  end

  private
    def item_params
      params.permit(:id, :name, :description, :unit_price, :merchant_id,
                    :created_at, :updated_at)
    end

    def price_sanitizer
      if params[:unit_price] && params[:unit_price].include?(".")
        params[:unit_price] = params[:unit_price].delete(".")
      end
    end
end
