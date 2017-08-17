class Api::V1::Customers::BiFavoriteMerchantController < ApplicationController

  def show
    render json: Customer.favorite_merchant(params[:id])
  end
end
