require 'rails_helper'

RSpec.describe "prescriptions/edit", type: :view do
  before(:each) do
    @prescription = assign(:prescription, Prescription.create!(
      number: "MyString",
      is_used: false,
      user: nil,
      for_adult_children: 1
    ))
  end

  it "renders the edit prescription form" do
    render

    assert_select "form[action=?][method=?]", prescription_path(@prescription), "post" do

      assert_select "input[name=?]", "prescription[number]"

      assert_select "input[name=?]", "prescription[is_used]"

      assert_select "input[name=?]", "prescription[user_id]"

      assert_select "input[name=?]", "prescription[for_adult_children]"
    end
  end
end
