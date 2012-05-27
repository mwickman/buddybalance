require 'spec_helper'

describe "transactions/new.html.haml" do
  before(:each) do
    assign(:transaction, stub_model(Transaction,
      :amount => "9.99",
      :confirmed => false,
      :from => 1,
      :to => 1
    ).as_new_record)
  end

  it "renders new transaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => transactions_path, :method => "post" do
      assert_select "input#transaction_amount", :name => "transaction[amount]"
      assert_select "input#transaction_confirmed", :name => "transaction[confirmed]"
      assert_select "input#transaction_from", :name => "transaction[from]"
      assert_select "input#transaction_to", :name => "transaction[to]"
    end
  end
end
