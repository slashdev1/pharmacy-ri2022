class StockManager

  def self.change_qty(product_id, delta_qty = nil, delta_reserve_qty = nil)
    record = Stock.find_by_product_id(product_id)
    if record.nil?
      record = Stock.new(product_id: product_id)
      record.qty = !delta_qty.nil? ? delta_qty : 0
      record.reserve_qty = !delta_reserve_qty.nil? ? delta_reserve_qty : 0
    else
      record.qty += delta_qty if !delta_qty.nil?
      record.reserve_qty += delta_reserve_qty if !delta_reserve_qty.nil?
    end
    record.save

    record
  end
  
  def self.get_qty(product_id)
    record = Stock.find_by_product_id(product_id)
    record.nil? ? 0 : record.qty - record.reserve_qty
  end

end