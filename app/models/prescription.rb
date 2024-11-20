class Prescription < ApplicationRecord
  belongs_to :patient

  validates :detail, presence: true
  validates :date, presence: true
end
