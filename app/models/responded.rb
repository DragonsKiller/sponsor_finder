class Responded < ApplicationRecord
  belongs_to :idea
  belongs_to :investor

  validates :idea_id, :investor_id, presence: true
end
