class SalaryCalculator
  SALES_PERCENTAGE = 2

  def self.salary_total(user)
    OrderDetail.joins("inner join orders on order_details.order_id = orders.id
                and orders.order_status_id = #{OrderDetail.sanitize_sql(OrderStatus.get_done_status_id)}")
               .select('(order_details.qty * order_details.price) amount')
               .where('order_details.prescription_number in (select number from prescriptions where doctor_id = ?)', user.id)
               .sum(:amount) * SALES_PERCENTAGE / 100
  end
end