class API::V1::OrdersController < API::V1::BaseController

  def create
    order = Order.new(order_params)
    order.save if order.valid?
    respond_to_api order, :created, location: nil
  end

  private

  def order_params
    params.require(:order).permit(:album_id, :status, :user_id, prints_attributes: [:order_id, :photo_id, :quantity, :size])
  end

end
