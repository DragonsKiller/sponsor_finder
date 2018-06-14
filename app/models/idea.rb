class Idea < ApplicationRecord
  belongs_to :trader

  before_create :add_publication_end_date

  def add_publication_end_date
    self.publication_end_date = Date.today
  end
end
