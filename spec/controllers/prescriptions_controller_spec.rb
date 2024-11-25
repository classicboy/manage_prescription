require "rails_helper"

RSpec.describe PrescriptionsController, type: :controller do
  let(:doctor) { create(:doctor) }
  let(:patient) { create(:patient, doctor: doctor) }
  let(:prescription) { create(:prescription, patient: patient) }

  before { sign_in doctor }

  describe "GET #index" do
    before { get :index }

    it { expect(assigns(:prescriptions)).to include(prescription) }
    it { expect(response).to render_template(:index) }
  end

  describe "GET #show" do
    before { prescription; get :show, params: { id: prescription } }

    it { expect(assigns(:prescription)).to be_present }
    it { expect(response).to render_template(:show) }
  end

  describe "GET #new" do
    before { get :new }

    it { expect(assigns(:prescription)).to be_new_record }
    it { expect(response).to render_template(:new) }
  end

  describe "POST #create" do
    context "with valid params" do
      before { post :create, params: { prescription: attributes_for(:prescription, patient_id: patient.id) } }

      it { expect(assigns(:prescription)).to be_persisted }
      it { expect(response).to redirect_to(prescription_path(assigns(:prescription))) }
      it { expect(response).to have_http_status(:see_other) }
    end

    context "with invalid params" do
      before { post :create, params: { prescription: attributes_for(:prescription, :invalid, patient_id: patient.id) } }

      it { expect(assigns(:prescription)).not_to be_persisted }
      it { expect(response).to render_template(:new) }
      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

  describe "GET #edit" do
    before { prescription; get :edit, params: { id: prescription } }

    it { expect(assigns(:prescription)).to be_present }
    it { expect(response).to render_template(:edit) }
  end

  describe "PUT #update" do
    context "with valid params" do
      before { put :update, params: { id: prescription, prescription: attributes_for(:prescription) } }

      it { expect(assigns(:prescription)).not_to be_changed }
      it { expect(response).to redirect_to(prescription_path(assigns(:prescription))) }
      it { expect(response).to have_http_status(:see_other) }
    end

    context "with invalid params" do
      before { put :update, params: { id: prescription, prescription: attributes_for(:prescription, :invalid) } }

      it { expect(assigns(:prescription)).to be_changed }
      it { expect(response).to render_template(:edit) }
      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end
end
