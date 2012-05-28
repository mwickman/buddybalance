# == Schema Information
#
# Table name: buddies
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Buddy do
  before do
    @buddy = Buddy.new(name: "Alex", email: "alex@pause-break.net",
                       password: "foobar", password_confirmation: "foobar")
  end

  subject { @buddy }

  it { should respond_to :name }
  it { should respond_to :email }
  it { should respond_to :password_digest }
  it { should respond_to :password }
  it { should respond_to :password_confirmation }
  it { should respond_to :remember_token }
  it { should respond_to :authenticate }

  it { should be_valid }

  describe "when name is not present" do
    before { @buddy.name = " " }
    it { should_not be_valid }
  end
  describe "when email is not present" do
    before { @buddy.email = " " }
    it { should_not be_valid }
  end
  describe "when name is too long" do
    before { @buddy.name = "a"*51 }
    it { should_not be_valid }
  end 
  describe "need unique emails" do 
    before do
      buddy_with_same_email = @buddy.dup
      buddy_with_same_email.email = @buddy.email.upcase
      buddy_with_same_email.save
    end
    it { should_not be_valid }
  end
  describe "when password is not present" do
    before { @buddy.password = @buddy.password_confirmation = " " }
    it { should_not be_valid }
  end
  describe "when there is a password mismatch" do
    before { @buddy.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
  describe "when password confirmation is nil" do
    before { @buddy.password_confirmation = nil }
    it { should_not be_valid }
  end
  describe "return value of authenticate" do
    before { @buddy.save }
    let(:found_user) { Buddy.find_by_email @buddy.email }

    describe "with valid password" do
      it { should == found_user.authenticate( @buddy.password ) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate( "invalid" ) }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end
  describe "user with a password that's too short" do
    before { @buddy.password = @buddy.password_confirmation = "f"*5 }
    it { should be_invalid }
  end

  describe "email downcasing" do
    let(:mixed_case_email) { "bRiAn@gMaIl.com" }
    it "should all be lower case" do
      @buddy.email = mixed_case_email
      @buddy.save
      @buddy.reload.email.should == mixed_case_email.downcase
    end
  end

  describe "remember token" do
    before { @buddy.save }
    its(:remember_token) { should_not be_blank }
  end
end

