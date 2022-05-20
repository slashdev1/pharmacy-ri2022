class OrderMailer < ApplicationMailer
  default from: 'noreply@pharmacy-ri2022.herokuapp.com'

  def order_placed
    @user = current_user
    @order = params[:@order]

    @order_url = order_url(@order)

    mail(to: @user.email, subject: 'Placed order ##{@order.id}')
  end
end
