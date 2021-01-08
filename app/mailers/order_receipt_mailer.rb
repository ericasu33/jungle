class OrderReceiptMailer < ApplicationMailer
  default from: 'ericasu33@gmail.com'
  
  def order_receipt(order_session_id_hash)
    @user = User.find(order_session_id_hash[:session_id])
    @order = Order.find(order_session_id_hash[:order_id])

    puts "EMAIL #{@user.email}"
    mail(to: @user.email, 
         subject: "Order Receipt for Order ID: #{@order.id}")
  end
end
