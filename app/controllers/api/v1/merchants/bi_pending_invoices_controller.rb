class Api::V1::Merchants::BiPendingInvoicesController < ApplicationController

  def index
    render json: Merchant.pending_invoices(params[:id])
  end
end
