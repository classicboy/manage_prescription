require "rails_helper"

RSpec.describe Doctor, type: :model do
  it { is_expected.to have_many(:patients).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to allow_value("doctor@example.com").for(:email) }
  it { is_expected.not_to allow_value("invalid_email").for(:email) }
  it { expect(build(:doctor)).to validate_uniqueness_of(:email).case_insensitive }

  it { is_expected.to validate_presence_of(:username) }
end