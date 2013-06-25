class API::V1::OrdersController < ApplicationController

  def create
    order = Order.new(params[:order])
    order.save if order.valid?
    status_code = order.errors.empty? ? 201 : 422
    respond_to do |format|
      format.json { render json: order, meta: order.errors, meta_key: :errors, status: status_code, location: nil }
    end
  end

end
