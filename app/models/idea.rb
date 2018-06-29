class Idea < ApplicationRecord
  belongs_to :trader
  has_many :respondeds, dependent: :destroy
  has_many :investors, through: :respondeds

  validates :name, length: { minimum: 5, maximum: 50 }, presence: true, uniqueness: true
  validates :description, length: { minimum: 10, maximum: 300 }, presence: true
  validates :problem, length: { minimum: 5, maximum: 20 }, presence: true
  validates :industry, length: { minimum: 5, maximum: 20 }, presence: true
  validates :team, length: { minimum: 2, maximum: 20 }, presence: true
  validates :geographical_focus, length: { minimum: 4, maximum: 50 }, presence: true
  validates :requirements, length: { minimum: 2, maximum: 100 }, presence: true
  validates :next_steps, length: { minimum: 2, maximum: 100 }, presence: true
  validates :trader_id, presence: true

  before_create :add_publication_end_date
  after_create :send_email

  def add_publication_end_date
    self.publication_end_date = Date.today
  end

  def send_email
    IdeaToInvestorMailer.sample_email("iharidla@gmail.com", self).deliver_later(wait: 1.second)
  end
end
