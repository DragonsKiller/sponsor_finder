class Investor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :respondeds, dependent: :destroy
  has_many :ideas, through: :respondeds

  validates :email, uniqueness: true
  validates :name, presence: true
  validates :phone, phone: true, allow_blank: true
end
