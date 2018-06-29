require 'rails_helper'

RSpec.describe Trader, :type => :model do
  let :trader do
     build :trader
   end

   subject do
    trader
   end

   context 'is invalid' do
     it 'when required #email is not given' do
       trader.email = ''
       should_not be_valid
     end

     it 'when required #password is not given' do
       trader.password = ''
       should_not be_valid
     end

     it 'when required #full_name is not given' do
       trader.name = ''
       should_not be_valid
     end

     it 'when #email is not unique' do
       trader.save
       trader1 = build :trader
       trader1.save

       trader1.should_not be_valid
       trader1.errors.full_messages[0].should match 'Email has already been taken'
     end

     it 'when #email format is not valid' do
       trader.email = 'invalid mail'
       should_not be_valid
     end

     it 'when #password is not at least 6 characters' do
       trader.password = 'abc12'
       should_not be_valid
     end
   end

   it 'is valid' do
     should be_valid
   end

  describe "associations" do
    it { should have_many(:ideas) }
  end

  describe 'validation' do

    it { should validate_length_of(:name).is_at_least(5).is_at_most(50) }
    it { should validate_presence_of(:name) }

    it { should validate_length_of(:email).is_at_least(3).is_at_most(50) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'column_specification' do
    it { should have_db_column(:name).of_type(:string).with_options(length: { minimum: 5, maximum: 50 }, presence: true)}
    it { should have_db_column(:email).of_type(:string).with_options(length: { minimum: 3, maximum: 50 }, presence: true, uniqueness: true) }
  end

end
