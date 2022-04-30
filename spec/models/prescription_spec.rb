require 'rails_helper'

RSpec.describe Prescription, type: :model do
  let(:prescription) { build :prescription }

  it 'should initialize prescription with number' do
    expect(prescription.number).to eq('РЛ000001')
  end
  it 'should initialize prescription with is_used' do
    expect(prescription.is_used).to eq(false)
  end
  it 'should initialize prescription with user' do
    expect(prescription.doctor_id).to eq(3)
  end
  it 'should initialize prescription with for_adult_children' do
    expect(prescription.for_adult_children).to eq("for_adult")
  end
end
