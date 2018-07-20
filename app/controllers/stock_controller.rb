class StockController < ApplicationController
  def search
    if params[:stock].blank?
      flash.now[:danger] = "You have entered an incorrect symbol"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "You have entered an empty search string" unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end
  
end
