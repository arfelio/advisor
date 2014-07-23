require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!
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
    it { should have_xpath('//p/img') }
    it { should have_css("img[src$='#{hotel.image.thumb.url}']") }

    describe "in rating controller" do
      let(:user) { FactoryGirl.create(:user) }
      let(:rating) { FactoryGirl.create(:rating) }

      before do
        login_as(user, scope: :user)
        visit hotel_path(hotel)
      end

      after(:each) { Warden.test_reset! }

      it { should have_content('Rate this hotel') }
      it { should have_select('rating_rating',:options=>['1 star','2 stars',
                                              '3 stars','4 stars','5 stars']) }

      describe "it should rate the hotel" do
        before { select('5 stars', :from => 'rating_rating') }

        it "should create a rating" do
          expect { click_button "Rate" }.to change(Rating, :count).by(1)
        end

      describe "after clicking button 'rate'" do
        before { click_button 'Rate' }
        it { should have_content('Success! you rate this Hotel') }
      end

      describe "when you try rate already rated hotel by clicking button
       'rate' two times" do
        before { click_button 'Rate' }
        before { click_button 'Rate' }

        it { should have_content('you already rate this gotel') }

        it "should not create a rating" do
          expect { 2.times{click_button "Rate"} }.not_to change(Rating, :count)
        end
      end
     end
    end

    describe "in comments controller" do
      let(:user) { FactoryGirl.create(:user) }
      let(:comment) { FactoryGirl.create(:comment) }

      before do
        login_as(user, scope: :user)
        visit hotel_path(hotel)
      end

      after(:each) { Warden.test_reset! }

      it { should have_button('Leave comment') }

      describe "with valid information" do
        before { fill_in "Content", with: "Lorem ipsum" }

        it "should create a comment" do
          expect { click_button "Leave comment" }.to change(Comment, :count).by(1)
        end

        describe "after adding comment" do
          before { click_button "Leave comment" }
          it { should have_content('You add a comment') }
        end
      end

      describe "with invalid data" do

        it "should not create a comment" do
          expect { click_button "Leave comment" }.not_to change(Comment, :count)
        end

        describe "after submission" do
          before { click_button "Leave comment" }
          it { should have_content(" Comment not added")}
        end
      end
    end
   end

    describe "New hotel page" do
      let(:user) { FactoryGirl.create(:user) }

      before do
         login_as(user, scope: :user)
         visit new_hotel_path
      end

      after(:each) { Warden.test_reset! }
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

  describe "index page" do

    before do
      25.times do
        FactoryGirl.create(:hotel)
      end
      visit hotels_path
    end
    after { Hotel.delete_all }

     it "should have a list of hotels" do
       Hotel.page(1).each do |hotel|
         page.should have_content(hotel.title)
         page.should have_link("More details about this hotel")
       end
     end
  end
end
