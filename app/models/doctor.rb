class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :registerable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  has_many :patients, dependent: :destroy
  has_many :prescriptions, through: :patients

  validates :email, presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "invalid format" },
                    uniqueness: { case_sensitive: false }
  validates :username, presence: true
end
