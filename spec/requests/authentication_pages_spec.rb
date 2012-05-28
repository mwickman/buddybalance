require 'spec_helper'

describe "Authentication" do
  subject { page }
  describe "signin page" do 
    before { visit signin_path }

    describe "invalid signin information" do
      before { click_button "Sign in" }
      it { should have_selector "title", text: "Sign In" }
      it { should have_selector( 'div.alert.alert-error', text: 'Incorrect email/password combination.') }

      describe "after visiting another page" do
        before { click_link "About" }
        it { should_not have_selector("div.alert.alert-error", text: "Incorrect email/password combination.") }
      end
    end
    describe "with valid signin information" do
      let(:buddy) { FactoryGirl.create(:buddy) }
      before do
        fill_in "Email",      with: buddy.email
        fill_in "Password",   with: buddy.password
        click_button "Sign in"
      end
      it { should have_selector 'title', text: buddy.name }
      it { should have_link 'Sign out', href: signout_path }
      it { should_not have_link 'Sign in', href: signin_path }
      it { should_not have_selector("div.alert.alert-error", text: "Incorrect email/password combination.") }

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link 'Sign in' }
      end
    end
  end
end
