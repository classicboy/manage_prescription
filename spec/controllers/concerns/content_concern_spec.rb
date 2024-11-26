require "rails_helper"

RSpec.describe ContentConcern, type: :concern do
  include ContentConcern

  describe "#filter_records" do
    let(:doctor) { create(:doctor) }
    let(:patient) { create(:patient, doctor: doctor) }
    let(:prescription) { create(:prescription, patient: patient) }
    let(:params) { {} }

    subject { filter_records(doctor.prescriptions) }

    context "empty params" do
      it { is_expected.to include prescription }
    end

    context "search by name" do
      let(:params) { { title: patient.name.first(2) } }
      it { is_expected.to include prescription }
    end

    context "search by phone" do
      let(:params) { { title: patient.phone.first(2) } }
      it { is_expected.to include prescription }
    end
  end
end
