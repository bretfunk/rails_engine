class Api:V1::Mercants::FavoriateCustomersController < ApplicationController

  def index
    render json:
  end
end


# GET /api/v1/merchants/:id/favorite_customer returns the customer who has conducted the most total number of successful transactions.
