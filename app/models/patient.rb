class Patient < ApplicationRecord
  belongs_to :doctor
  has_many :prescriptions, dependent: :destroy

  validates :name, presence: true
  validates :phone, presence: true, format: { with: /\A(\+?[1-9]\d{1,14}|0\d{9,10})\z/, message: "invalid format" }
  validates :dob, presence: true
end
