require 'rails_helper'

RSpec.describe Responded, :type => :model do
  describe 'validation' do
    it { should validate_presence_of(:idea_id) }
    it { should validate_presence_of(:investor_id) }
  end

  describe 'association' do
    it { should belong_to(:idea) }
    it { should belong_to(:investor) }
  end

  describe 'column_specification' do
    it { should have_db_column(:idea_id).of_type(:integer).with_options(presence: true) }
    it { should have_db_column(:investor_id).of_type(:integer).with_options(presence: true) }
  end
end
