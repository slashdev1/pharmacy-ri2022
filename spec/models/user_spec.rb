require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create :user }

  it 'should initialize user with role and name' do
    expect(user.role_id).to eq(1)
    expect(user.name).to eq('Фармацевт Аня')
  end

  context 'when user isn\'t valid' do
    let(:no_valid_name_user) { build :no_valid_name_user }

    it 'is not valid with short name' do

      expect(no_valid_name_user).to_not be_valid
    end
  end
end
