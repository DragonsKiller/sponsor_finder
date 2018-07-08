class Investor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :respondeds, dependent: :destroy
  has_many :ideas, through: :respondeds

  validates :name, length: { minimum: 5, maximum: 50 }, presence: true
  validates :email, length: { minimum: 3, maximum: 50 }, presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
                    message: 'The format of Email is invalid'}
  validates :password, presence: true, length: { minimum: 6 }
  validates :phone, phone: true, allow_blank: true

  before_validation :downcase_email

  has_many :pictures, as: :imageable

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end
end
