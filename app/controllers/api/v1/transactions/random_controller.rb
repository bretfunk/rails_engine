class Api::V1::Transactions::RandomController < ApplicationController

  def show
    render json: Transaction.find(rand(1..Transaction.count))
  end
end

