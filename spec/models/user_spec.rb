require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'default user details' do
    let(:user) { User.new(name: 'Alex Doc', role: 2) }

    it 'should initialize worker with name and role' do
      expect(user.name).to eq("Alex Doc")
      expect(user.role_id).to eq(2)
    end
  end
end
