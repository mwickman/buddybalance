require 'spec_helper'

describe "Buddies Pages" do

  subject { page }
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

      describe "after saving the user" do

        before { click_button submit }

        let(:buddy) { Buddy.find_by_email( "email@example.com" ) }
        
        # we'll revisit this later
        it { should have_selector('title', text: buddy.name) }
        it { should have_link( 'Sign out' ) } 
        it { should_not have_link( 'Sign in' ) }
      end
    end
  end
end
