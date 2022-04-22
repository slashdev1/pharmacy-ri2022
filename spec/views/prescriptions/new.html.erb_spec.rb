require 'rails_helper'

RSpec.describe "prescriptions/new", type: :view do
  before(:each) do
    assign(:prescription, Prescription.new(
      number: "MyString",
      is_used: false,
      user: nil,
      for_adult_children: 1
    ))
  end

  it "renders new prescription form" do
    render

    assert_select "form[action=?][method=?]", prescriptions_path, "post" do

      assert_select "input[name=?]", "prescription[number]"

      assert_select "input[name=?]", "prescription[is_used]"

      assert_select "input[name=?]", "prescription[user_id]"

      assert_select "input[name=?]", "prescription[for_adult_children]"
    end
  end
end
