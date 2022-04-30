require 'rails_helper'

RSpec.describe Stock, type: :model do
  let(:stock) { build :stock }

  it 'should initialize stock with product' do
    expect(stock.product_id).to eq(2)
  end
  context 'when stock isn\'t valid' do
    let(:no_valid_product_stock) { build :no_valid_product_stock }

    it 'doesn\'t have product' do
      expect(no_valid_product_stock).to_not be_valid
    end
  end
end
