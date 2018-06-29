require 'rails_helper'

RSpec.describe Idea, :type => :model do


  describe "associations" do
    it { should belong_to(:trader) }
    it { should have_many(:respondeds) }
    it { should have_many(:investors).through(:respondeds) }
  end

  describe 'validation' do
    it { should validate_length_of(:name).is_at_least(5).is_at_most(50) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }

    it { should validate_length_of(:description).is_at_least(10).is_at_most(300) }

    it { should validate_length_of(:problem).is_at_least(5).is_at_most(20) }

    it { should validate_length_of(:industry).is_at_least(5).is_at_most(20) }

    it { should validate_length_of(:team).is_at_least(2).is_at_most(20) }

    it { should validate_length_of(:geographical_focus).is_at_least(4).is_at_most(50) }

    it { should validate_length_of(:requirements).is_at_least(2).is_at_most(100) }

    it { should validate_length_of(:next_steps).is_at_least(2).is_at_most(100) }

    it { should validate_presence_of(:trader_id) }
  end

  describe 'column_specification' do
    it { should have_db_column(:name).of_type(:string).with_options(length: { minimum: 5, maximum: 50 }, presence: true, uniqueness: true)}
    it { should have_db_column(:description).of_type(:text).with_options(length: { minimum: 10, maximum: 300 }, presence: true) }
    it { should have_db_column(:problem).of_type(:text).with_options(length: { minimum: 5, maximum: 20 }, presence: true) }
    it { should have_db_column(:industry).of_type(:string).with_options(length: { minimum: 5, maximum: 20 }, presence: true) }
    it { should have_db_column(:team).of_type(:string).with_options(length: { minimum: 2, maximum: 20 }, presence: true) }
    it { should have_db_column(:geographical_focus).of_type(:string).with_options(length: { minimum: 4, maximum: 50 }, presence: true) }
    it { should have_db_column(:requirements).of_type(:string).with_options(length: { minimum: 2, maximum: 100 }, presence: true) }
    it { should have_db_column(:next_steps).of_type(:text).with_options(length: { minimum: 2, maximum: 100 }, presence: true)}
    it { should have_db_column(:trader_id).of_type(:integer) }
  end

  describe '.search_by_name' do
    before(:each) do
      FactoryBot.create(:idea, name: 'Ruby on Rails')
    end

    it 'returns idea that match with name' do
      Idea.search_by_name('Ruby on Rails').count.should eql 1
    end

    it 'returns idea that like idea' do
      Idea.search_by_name('ruby on rails').count.should eql 1
    end

    it 'returns idea when name is blank' do
      Idea.search_by_name('').count.should eql 1
    end

    it 'returns empty when idea is not match' do
      Idea.search_by_name('not match').count.should eql 0
    end
  end

end
