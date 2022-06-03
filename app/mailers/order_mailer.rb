class OrderMailer < ApplicationMailer
  default from: 'noreply@pharmacy-ri2022.herokuapp.com'

  def order_placed(user, order)
    @user = user
    @order = order
    @order_url = order_url(@order)

    mail(to: @user.email, subject: 'Замовлення №#{@order.id} у аптеці Pharmacy-RI2022')
  end
end
