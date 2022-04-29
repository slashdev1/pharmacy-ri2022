require 'rails_helper'

RSpec.describe "/arrivals", type: :request do
  
  let(:valid_attributes) {
    { product_id: 1, price: 6.99, qty: 1}
  }

  let(:invalid_attributes) {
    { product_id: 1, price: 0, qty: 0}
  }

  describe "GET /index" do
    let(:product) { create(:product_adult) }

    it "renders a successful response" do
      valid_attributes.store(:product_id, product.id)

      Arrival.create! valid_attributes
      get arrivals_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    #let(:user) { create(:user) }
    #let(:order) { create(:order, { user_id: user.id }) }
    let(:product) { create(:product_adult) }

    it "renders a successful response" do
      #valid_attributes.store(:order_id, order.id)
      valid_attributes.store(:product_id, product.id)

      arrival = Arrival.create! valid_attributes
      get arrival_url(arrival)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_arrival_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    let(:product) { create(:product_adult) }

    it "renders a successful response" do
      valid_attributes.store(:product_id, product.id)

      arrival = Arrival.create! valid_attributes
      get edit_arrival_url(arrival)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    let(:product) { create(:product_adult) }

    context "with valid parameters" do

      it "creates a new Arrival" do
        valid_attributes.store(:product_id, product.id)

        expect {
          post arrivals_url, params: { arrival: valid_attributes }
        }.to change(Arrival, :count).by(1)
      end

      it "redirects to the created arrival" do
        valid_attributes.store(:product_id, product.id)

        post arrivals_url, params: { arrival: valid_attributes }
        expect(response).to redirect_to(arrival_url(Arrival.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Arrival" do
        expect {
          post arrivals_url, params: { arrival: invalid_attributes }
        }.to change(Arrival, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post arrivals_url, params: { arrival: invalid_attributes }
        #expect(response).to be_successful
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PATCH /update" do
    let(:product) { create(:product_adult) }
    let(:other_product) { create(:product_children) }

    context "with valid parameters" do
      let(:new_attributes) {
        { price: 9.50, qty: 10 }
      }

      it "updates the requested arrival" do
        valid_attributes.store(:product_id, product.id)
        new_attributes.store(:product_id, other_product.id)

        arrival = Arrival.create! valid_attributes
        patch arrival_url(arrival), params: { arrival: new_attributes }
        arrival.reload
        expect(arrival.price).to eq(new_attributes[:price])
        expect(arrival.qty).to eq(new_attributes[:qty])
      end

      it "redirects to the arrival" do
        valid_attributes.store(:product_id, product.id)
        new_attributes.store(:product_id, other_product.id)

        arrival = Arrival.create! valid_attributes
        patch arrival_url(arrival), params: { arrival: new_attributes }
        arrival.reload
        expect(response).to redirect_to(arrival_url(arrival))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        valid_attributes.store(:product_id, product.id)

        arrival = Arrival.create! valid_attributes
        patch arrival_url(arrival), params: { arrival: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    let(:product) { create(:product_adult) }

    it "destroys the requested arrival" do
      valid_attributes.store(:product_id, product.id)

      arrival = Arrival.create! valid_attributes
      expect {
        delete arrival_url(arrival)
      }.to change(Arrival, :count).by(-1)
    end

    it "redirects to the arrivals list" do
      valid_attributes.store(:product_id, product.id)

      arrival = Arrival.create! valid_attributes
      delete arrival_url(arrival)
      expect(response).to redirect_to(arrivals_url)
    end
  end
end
