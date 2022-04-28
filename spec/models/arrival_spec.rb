require 'rails_helper'

RSpec.describe Arrival, type: :model do
  let(:arrival) { build :arrival }

  it 'should initialize arrival with qty and price' do
    expect(arrival.qty).to eq(1)
    expect(arrival.price).to eq(2.50)
  end
end
