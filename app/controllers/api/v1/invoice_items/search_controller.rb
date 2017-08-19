class Api::V1::InvoiceItems::SearchController < ApplicationController
  before_action :price_sanitizer

  def index
    render json: InvoiceItem.where(invoice_item_params)
  end

  def show
    render json: InvoiceItem.find_by(invoice_item_params)
  end

  private
    def invoice_item_params
      params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at,
                    :updated_at)
    end

    def price_sanitizer
      if params[:unit_price] && params[:unit_price].include?(".")
        params[:unit_price] = params[:unit_price].delete(".")
      end
    end
end
