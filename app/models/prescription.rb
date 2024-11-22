class Prescription < ApplicationRecord
  belongs_to :patient

  validates :detail, presence: true
  validates :date, presence: true

  delegate :name, to: :patient, prefix: true
  delegate :phone, to: :patient, prefix: true
end
