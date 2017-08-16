class Api::V1::Merchants::RandomController < ApplicationController

  def show
    render json: Merchant.find(rand(Merchant.count))
  end
end
