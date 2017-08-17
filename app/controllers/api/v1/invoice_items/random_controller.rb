class Api::V1::InvoiceItems::RandomController < ApplicationController

  def show
    render json: InvoiceItem.find(rand(1..InvoiceItem.count))
  end

end
