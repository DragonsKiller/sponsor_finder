class Trader < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ideas, dependent: :destroy

  validates :email, uniqueness: true
  validates :name, presence: true
  validates :phone, phone: true, allow_blank: true
end
