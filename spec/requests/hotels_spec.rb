require 'spec_helper'

describe "Hotels" do
  subject { page }
  describe "Show page" do
    let(:hotel) { FactoryGirl.create(:hotel) }
    before { visit hotel_path(hotel) }
    it { should have_content(hotel.title) }
    it { should have_content(hotel.room_description) }
    it { should have_content(hotel.price_for_room) }
    it { should have_content(hotel.breakfast_included) }
  end
end
