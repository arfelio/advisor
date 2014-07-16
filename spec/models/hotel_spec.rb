require 'spec_helper'
require 'debugger'
describe Hotel do
  subject { @hotel }
  before(:each) do
    @hotel = FactoryGirl.create(:hotel)

    end

 # subject { @hotel }

  it { should respond_to(:title) }
  it { should respond_to(:room_description) }
  it { should respond_to(:breakfast_included) }
  it { should respond_to(:price_for_room) }
  it { should respond_to(:image) }
  it { should validate_presence_of(:title) }
  it { expect(subject).to validate_presence_of :room_description }
  it { should_not allow_value(-100).for(:price_for_room) }
    it { should be_valid }

#it "is invalid without country field" do
#      @hotel.location.country = nil
 #     @hotel.should_not be_valid
 #   end
  describe "when title is too long" do
    before { @hotel.title = "a"*141 }
    it { should_not be_valid }
  end

  describe "when room description is too long" do
    before { @hotel.room_description = "a"*1001 }
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
 #let(:unfollowed_post) do
  #      FactoryGirl.create(:micropost, user: FactoryGirl.create(:user))
  #    end