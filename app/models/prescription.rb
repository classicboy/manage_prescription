class Prescription < ApplicationRecord
  belongs_to :patient

  validates :detail, presence: true
end
