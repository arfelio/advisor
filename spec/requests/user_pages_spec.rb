require 'spec_helper'

describe "UserPages" do
  subject { page }

  describe "sign in page" do
    before { visit new_user_session_path }

    it { should have_content("Sign in") }
    it { should have_content('Sign up') }
  end

  describe "signin" do
    before { visit new_user_session_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_link('Sign in') }
      it { should have_selector('div.alert.alert-alert') }
      end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { visit new_user_session_path }

      before do
        fill_in "Email",    with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_link("Sign out") }
      it { should have_content(user.email) }
    end
  end

   describe "Sign up page" do
      before { visit new_user_registration_path }

      it { should have_content("Sign up") }
    end

    describe "signup" do
      before { visit new_user_registration_path }

      describe "with invalid information" do
        before { click_button "Sign up" }
        it { should have_selector('div#error_explanation') }
      end

      describe "with valid information" do
        before { visit new_user_registration_path }

        before do
          fill_in "Email",    with: "example1@gmail.com"
          fill_in "Password", with: "qwerty12"
          fill_in "Password confirmation", with: "qwerty12"
        end

        it "should create a user" do
        expect { click_button "Sign up" }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button "Sign up" }

        it { should have_link("Sign out") }
        it { should have_content("Welcome! You have signed up successfully") }
      end
     end
   end

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "in the Hotels controller" do

        describe "submitting to the create action" do
          before { post hotels_path }
          specify { expect(response).to redirect_to(new_user_session_path) }
        end
      end
    end
end