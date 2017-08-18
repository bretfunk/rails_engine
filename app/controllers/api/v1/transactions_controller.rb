class Api::V1::TransactionsController < ApplicationController

  def index
    render json: Transaction.all, each_serializer: TransactionSerializer
  end

  def show
    render json: Transaction.find(params[:id]), serializer: TransactionSerializer
  end
end
