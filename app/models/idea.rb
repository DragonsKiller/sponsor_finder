class Idea < ApplicationRecord
  belongs_to :trader
  has_many :respondeds, dependent: :destroy
  has_many :investors, through: :respondeds

  before_create :add_publication_end_date

  def add_publication_end_date
    self.publication_end_date = Date.today
  end
end
