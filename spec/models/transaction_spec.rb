require 'spec_helper'

describe Transaction do
  before do
    @transaction = Transaction.new(amount: 15, target: 1, creator: 2)
  end
  subject { @transaction }
  
  it { should respond_to :amount }
  it { should respond_to :target }
  it { should respond_to :creator }
  it { should respond_to :confirmed }
  
  describe "amount should not be 0" do
    before { @transaction.amount = 0 }
    it { should_not be_valid }
  end
  
  describe "amount should be rounded to two decimals" do
    before do 
      @transaction.amount = 8.128
      @transaction.save
      @transaction.reload
    end
    
    its(:amount) { should.eql? 8.13 }
  end
  
  describe "transactions should have creator" do
    before do
      @transaction.creator = nil
    end
    it { should_not be_valid }
  end
  
  describe "transactions should have target" do
    before do
      @transaction.target = nil
    end
    it { should_not be_valid }
  end
  
  describe "confirmed should be false on creation" do
    its(:confirmed) { should be_false }
  end
  
end
