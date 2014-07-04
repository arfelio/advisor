require 'spec_helper'

describe "Hotels" do
  subject { page }
  describe "Show page" do
    let(:hotel) { FactoryGirl.create(:hotel) }
    let!(:loc) { FactoryGirl.create(:location, hotel:hotel)}

    before { visit hotel_path(hotel) }

    it { should have_content(hotel.title) }
    it { should have_content(hotel.room_description) }
    it { should have_content(hotel.price_for_room) }
    it { should have_content(hotel.breakfast_included) }
    it { should have_content(loc.country) }
    it { should have_content(loc.state) }
    it { should have_content(loc.city) }
    it { should have_content(loc.street) }
  end
end
