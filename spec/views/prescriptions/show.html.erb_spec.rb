require 'rails_helper'

RSpec.describe "prescriptions/show", type: :view do
  before(:each) do
    @prescription = assign(:prescription, Prescription.create!(
      number: "Number",
      is_used: false,
      user: nil,
      for_adult_children: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
