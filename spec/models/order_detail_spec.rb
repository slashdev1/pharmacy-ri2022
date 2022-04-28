require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  let(:detail) { build :detail }

  it 'should initialize order detail with product, qty and price' do
    expect(detail.product_id).to eq(1)
    expect(detail.qty).to eq(2)
    expect(detail.price).to eq(3.99)
  end
  context 'when detail isn\'t valid' do
    let(:no_valid_qty_detail) { build :no_valid_qty_detail }

    it 'is not valid with 0 qty' do
      expect(no_valid_qty_detail).to_not be_valid
    end
  end
  context 'when detail isn\'t valid' do
    let(:no_valid_product_detail) { build :no_valid_product_detail }

    it 'doesn\'t have product' do
      expect(no_valid_product_detail).to_not be_valid
    end
  end
end
