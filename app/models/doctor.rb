class Doctor < ApplicationRecord
  has_many :patients, dependent: :destroy

  validates :email, presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "invalid format" },
                    uniqueness: { case_sensitive: false }
  validates :username, presence: true
end
