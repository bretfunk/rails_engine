class Api::V1::Customers::TransactionsController < ApplicationController

  def index
    # render json: Transaction.where(invoice_id: Customer.find(params[:id]).invoices.joins("INNER JOIN transactions
    #                         ON transactions.invoice_id = invoices.id").pluck(:invoice_id))
    render json: Transaction.where(invoice_id: Customer.find(params[:id]).invoices.pluck(:id))
  end
end
