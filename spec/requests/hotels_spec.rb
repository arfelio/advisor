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
    it { should have_xpath('//div/img') }
    it { should have_css("img[src$='#{hotel.image.thumb.url}']") }

  end

  describe "New hotel page" do
    before { visit new_hotel_path }
    let(:submit) { "Create new hotel" }

    describe "with invalid information" do
      it "should not create a hotel" do
        expect { click_button submit }.not_to change(Hotel, :count)
      end
      describe "after submission" do

      before { click_button submit }

      it { should have_content('error') }
      it { should have_css('#error_explanation') }
      it { should have_selector(:xpath, "//div[@class='field_with_errors']") }

      end
    end
    describe "with valid information" do
      before do
        attach_file('Image', 'spec/fixtures/files/image.png')
        fill_in "Title",              with: "Example Title"
        fill_in "Room description",   with: "Lorem Ipsum"
        fill_in "Price for room",     with: 100
        choose('hotel_breakfast_included_yes')
        fill_in "Country",            with: "usa"
        fill_in "State",              with: "Alaska"
        fill_in "City",               with: "Ancoridg"
        fill_in "Street",             with: "avenue"
      end
      it "should create a user" do
        expect { click_button submit }.to change(Hotel, :count).by(1)
      end
      describe "after saving the hotel" do
        before { click_button submit }
        let(:hotel) { Hotel.where(title: 'Example Title') }

        it { should have_content("Lorem Ipsum") }
        it { should have_selector('div.alert.alert-success', text: 'Success!') }
        it { should have_selector("img") }
      end
    end
  end
end
