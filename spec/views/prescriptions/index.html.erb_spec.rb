require 'rails_helper'

RSpec.describe "prescriptions/index", type: :view do
  before(:each) do
    assign(:prescriptions, [
      Prescription.create!(
        number: "Number",
        is_used: false,
        user: nil,
        for_adult_children: 2
      ),
      Prescription.create!(
        number: "Number",
        is_used: false,
        user: nil,
        for_adult_children: 2
      )
    ])
  end

  it "renders a list of prescriptions" do
    render
    assert_select "tr>td", text: "Number".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
