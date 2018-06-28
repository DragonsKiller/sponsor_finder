class Idea < ApplicationRecord
  belongs_to :trader
  has_many :respondeds, dependent: :destroy
  has_many :investors, through: :respondeds

  before_create :add_publication_end_date
  after_create :send_email

  def add_publication_end_date
    self.publication_end_date = Date.today
  end
end

def send_email
  IdeaToInvestorMailer.sample_email("iharidla@gmail.com", self).deliver_now
end
