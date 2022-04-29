require 'rails_helper'

RSpec.describe "arrivals/index", type: :view do
  before(:each) do
    assign(:arrivals, [
      Arrival.create!(),
      Arrival.create!()
    ])
  end

  it "renders a list of arrivals" do
    render
  end
end
