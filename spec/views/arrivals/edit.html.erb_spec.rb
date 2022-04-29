require 'rails_helper'

RSpec.describe "arrivals/edit", type: :view do
  before(:each) do
    @arrival = assign(:arrival, Arrival.create!())
  end

  it "renders the edit arrival form" do
    render

    assert_select "form[action=?][method=?]", arrival_path(@arrival), "post" do
    end
  end
end
