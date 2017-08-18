class Api::V1::Items::BiBestDayController < ApplicationController

  def show
    render json: Item.best_day(params[:id])
  end
end
