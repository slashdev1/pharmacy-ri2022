require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { build :order }

  it 'should initialize order with status' do
    expect(order.order_status_id).to eq(2)
  end
  it 'should initialize order with amount' do
    expect(order.amount).to eq(2*3.99)
  end
  it 'should initialize order with user' do
    expect(order.user_id).to eq(1)
  end
  context 'when order isn\'t valid' do
    let(:no_valid_status_order) { build :no_valid_status_order }
    let(:no_valid_amount_order) { build :no_valid_amount_order }

    it 'is not valid with wrong status' do
      expect(no_valid_status_order).to_not be_valid
    end
    it 'is not valid with 0 amount' do
      expect(no_valid_amount_order).to_not be_valid
    end
  end
end
