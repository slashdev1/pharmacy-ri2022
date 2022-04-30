require 'rails_helper'

RSpec.describe "/prescriptions", type: :request do

  let(:doctor) { create(:user) }

  let(:valid_attributes) {
    { number: 'РЛ000001', is_used: false, doctor_id: doctor.id, for_adult_children: 0 }
  }

  let(:invalid_attributes) {
    { number: 'РЛ-000001', is_used: nil, doctor_id: nil, for_adult_children: 1 }
  }

  let(:valid_prescription) { create(:prescription, valid_attributes) }

  describe "GET /index" do
    it "renders a successful response" do
      get prescriptions_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get prescription_url(valid_prescription)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_prescription_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      get edit_prescription_url(valid_prescription)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Prescription" do
        expect {
          post prescriptions_url, params: { prescription: valid_attributes }
        }.to change(Prescription, :count).by(1)
      end

      it "redirects to the created prescription" do
        post prescriptions_url, params: { prescription: valid_attributes }
        expect(response).to redirect_to(prescription_url(Prescription.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Prescription" do
        expect {
          post prescriptions_url, params: { prescription: invalid_attributes }
        }.to change(Prescription, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post prescriptions_url, params: { prescription: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { number: 'РЛ000001', is_used: true, doctor_id: doctor.id, for_adult_children: 0 }
      }

      it "updates the requested prescription" do
        patch prescription_url(valid_prescription), params: { prescription: new_attributes }
        valid_prescription.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the prescription" do
        patch prescription_url(valid_prescription), params: { prescription: new_attributes }
        valid_prescription.reload
        expect(response).to redirect_to(prescription_url(valid_prescription))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch prescription_url(valid_prescription), params: { prescription: invalid_attributes }
        valid_prescription.reload
        expect(valid_prescription.is_used).not_to eq(invalid_attributes[:is_used])
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:prescription_for_destroy) { create(:prescription, valid_attributes) }

    it "destroys the requested prescription" do
      expect {
        delete prescription_url(prescription_for_destroy)
      }.to change(Prescription, :count).by(-1)
    end

    it "redirects to the prescriptions list" do
      delete prescription_url(valid_prescription)
      expect(response).to redirect_to(prescriptions_url)
    end
  end
end
