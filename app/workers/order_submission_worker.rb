class OrderSubmissionWorker < BaseWorker

  def perform(args={})
    args = args.with_indifferent_access
    order = Order.find(args[:order_id])
    order.send_to_printer if order.present?
  end

end