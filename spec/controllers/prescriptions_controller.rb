require "rails_helper"

RSpec.describe PrescriptionsController, type: :controller do
  let(:doctor) { create(:doctor) }
  let!(:patient) { create(:patient, doctor: doctor) }
  let!(:prescriptions) { create_list(:prescription, 3, patient: patient) }

  before do
    sign_in doctor
  end

  describe "GET #index" do
    before { get :index }

    it { expect(response).to render_template(:index) }
    it { expect(assigns(:prescriptions)).to match_array(prescriptions) }
  end
end
