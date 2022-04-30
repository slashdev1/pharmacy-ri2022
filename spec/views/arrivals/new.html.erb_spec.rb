require 'rails_helper'

RSpec.describe "arrivals/new", type: :view do
  before(:each) do
    assign(:arrival, Arrival.new())
  end

  it "renders new arrival form" do
    render

    assert_select "form[action=?][method=?]", arrivals_path, "post" do
    end
  end
end
