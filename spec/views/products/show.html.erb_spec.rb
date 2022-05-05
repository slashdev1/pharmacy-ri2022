require 'rails_helper'

RSpec.describe "products/show", type: :view do
  let(:valid_product) { create :product_children }

  it "Show info about product" do
    assign(:product, valid_product)

    render

    expect(rendered).to match valid_product.id.to_s
    expect(rendered).to match valid_product.name
    expect(rendered).to match valid_product.price.to_s
    expect(rendered).to match valid_product.required_prescription.to_s
    expect(rendered).to match valid_product.for_adult_children
  end

  it "Show link to main list" do
    assign(:product, valid_product)

    render

    expect(rendered).to match 'Back'
  end
end
