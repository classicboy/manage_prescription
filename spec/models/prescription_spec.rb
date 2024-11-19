require "rails_helper"

RSpec.describe Prescription, type: :model do
  it { is_expected.to belong_to(:patient) }

  it { is_expected.to validate_presence_of(:detail) }
end
