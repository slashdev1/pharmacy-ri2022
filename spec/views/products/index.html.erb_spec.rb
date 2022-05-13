require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      FactoryBot.create(:product_children),
      FactoryBot.create(:product_adult)
    ])
  end

  it "renders a list of products" do
    render

    #expect(rendered).to render_template(:partial => "_form", :count => 2)
    assert_select "tr>td", text: "for_adult".to_s, count: 1
    assert_select "tr>td", text: "for_children".to_s, count: 1
  end
end
