require "rails_helper"

RSpec.describe Patient, type: :model do
  it { is_expected.to belong_to(:doctor) }
  it { is_expected.to have_many(:prescriptions).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to validate_presence_of(:phone) }
  it { is_expected.to allow_value("0123456789").for(:phone) }
  it { is_expected.to allow_value("+84123456789").for(:phone) }
  it { is_expected.not_to allow_value("012abc34567").for(:phone) }
  it { is_expected.not_to allow_value("+0123456789").for(:phone) }

  it { is_expected.to validate_presence_of(:dob) }
end
