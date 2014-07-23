require 'spec_helper'
require 'debugger'
describe Hotel do
  subject { @hotel }

  before(:each) do
    @hotel = FactoryGirl.create(:hotel)

    end

  context "#fields" do

    it { should respond_to(:title) }
    it { should respond_to(:room_description) }
    it { should respond_to(:breakfast_included) }
    it { should respond_to(:price_for_room) }
    it { should respond_to(:image) }

  end

  context "validations" do

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:price_for_room) }
    it { should validate_presence_of(:breakfast_included) }
    it { expect(subject).to validate_presence_of :room_description }
    it { should_not allow_value(-100).for(:price_for_room) }
    it { should be_valid }

    describe "when title is too long" do
      before { @hotel.title = "a"*141 }
      it { should_not be_valid }
    end

    describe "when room description is too long" do
      before { @hotel.room_description = "a"*1501 }
      it { should_not be_valid }
    end

    describe "when price for room is to big" do
      before { @hotel.price_for_room = 10001 }
      it { should_not be_valid }
    end

    describe "when breakfast_included is not 'yes' or 'no'" do
      before { @hotel.breakfast_included = "may be" }
      it { should_not be_valid }
    end
  end

  context "associations" do
    it { should have_many(:comments) }
    it { should have_many(:ratings) }
    it { should have_one(:location) }
    it { should belong_to(:user) }
    it { should accept_nested_attributes_for :location }
  end
end
