class API::V1::OrdersController < ApplicationController

  def create
    order = Order.new(order_params)
    order.save if order.valid?
    status_code = order.errors.empty? ? :created : :unprocessable_entity
    respond_to do |format|
      format.json { render json: order, meta: order.errors, meta_key: :errors, status: status_code, location: nil }
    end
  end

  private

  def order_params
    params.require(:order).permit(:album_id, :status, :user_id, prints_attributes: [:order_id, :photo_id, :quantity, :size])
  end

end
