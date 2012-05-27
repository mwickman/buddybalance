require 'spec_helper'

describe "Buddies Pages" do
  describe "Buddy SignUp" do
    before { visit signup_path }

    let( :submit ) { "Create My Account" }

    describe "With invalid information" do
      it "should not create a buddy" do
        expect { click_button submit }.not_to change( Buddy, :count )
      end
    end
    describe "With valid information" do 
      before do
        fill_in "Name",             with: "Example User"
        fill_in "Email",            with: "email@example.com"
        fill_in "Password",         with: "foobar"
        fill_in "Confirmation",     with: "foobar"
      end
      it "should create a user" do
        expect { click_button submit }.to change( Buddy, :count ).by(1)
      end
    end
  end
end
