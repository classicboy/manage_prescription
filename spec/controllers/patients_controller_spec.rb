require "rails_helper"

RSpec.describe PatientsController, type: :controller do
  let(:doctor) { create(:doctor) }
  let(:patient) { create(:patient, doctor: doctor) }

  before { sign_in doctor }

  describe "GET #index" do
    before { get :index }

    it { expect(assigns(:patients)).to include(patient) }
    it { expect(response).to render_template(:index) }
  end

  describe "GET #show" do
    before { patient; get :show, params: { id: patient } }

    it { expect(assigns(:patient)).to be_present }
    it { expect(response).to render_template(:show) }
  end

  describe "GET #new" do
    before { get :new }

    it { expect(assigns(:patient)).to be_new_record }
    it { expect(response).to render_template(:new) }
  end

  describe "POST #create" do
    context "with valid params" do
      before { post :create, params: { patient: attributes_for(:patient, patient_id: patient.id) } }

      it { expect(assigns(:patient)).to be_persisted }
      it { expect(response).to redirect_to(patient_path(assigns(:patient))) }
      it { expect(response).to have_http_status(:see_other) }
    end

    context "with invalid params" do
      before { post :create, params: { patient: attributes_for(:patient, :invalid, patient_id: patient.id) } }

      it { expect(assigns(:patient)).not_to be_persisted }
      it { expect(response).to render_template(:new) }
      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end
end
