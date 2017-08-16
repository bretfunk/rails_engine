class Api::V1::Merchants::RandomController < ApplicationController

  def show
    render json: Merchant.find(rand(1..Merchant.count))
  end
end
