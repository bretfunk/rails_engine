class Api::V1::Items::RandomController < ApplicationController

  def show
    render json: Item.find(rand(1..Item.count))
  end

end
