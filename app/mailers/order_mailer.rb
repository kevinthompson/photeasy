class OrderMailer < ActionMailer::Base
  layout 'email'
  default from: 'orders@photeasy.com'

  def confirmation(args = {})
    args = args.with_indifferent_access
    @order = Order.find(args[:order_id])
    subject = %[Your order is complete]
    mail(to: @order.user.email, subject: subject)
  end
end
