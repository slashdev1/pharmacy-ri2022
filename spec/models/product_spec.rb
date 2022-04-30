require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { create :product_children }

  it 'should initialize product with name' do
    expect(product.name).to eq('Подгузники')
  end
  it 'should initialize product with price' do
    expect(product.price).to eq(100)
  end
  it 'should initialize product with required_prescription' do
    expect(product.required_prescription).to eq(false)
  end
  it 'should initialize product with for_adult_children' do
    expect(product.for_adult_children).to eq("for_children")
  end
end
