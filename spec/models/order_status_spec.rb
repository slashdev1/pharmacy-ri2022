require 'rails_helper'

RSpec.describe OrderStatus, type: :model do
  let(:status) { build :status }

  it 'should initialize status with name' do
    expect(status.name).to eq('Отложен')
  end
  context 'when status isn\'t valid' do
    let(:no_uniq_name_status) { build :no_uniq_name_status }

    it 'should have a unique name' do
      #expect(no_uniq_name_status).to_not be_valid
      OrderStatus.create!(:name=>"Foo")
      foo_status = OrderStatus.new(:name=>"Foo")
      foo_status.should_not be_valid
      foo_status.errors[:name].should include("has already been taken")
    end
  end
end
