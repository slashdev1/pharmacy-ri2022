require 'rails_helper'

RSpec.describe "arrivals/show", type: :view do
  before(:each) do
    @arrival = assign(:arrival, Arrival.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
