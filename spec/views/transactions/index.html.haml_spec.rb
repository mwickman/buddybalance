require 'spec_helper'

describe "transactions/index.html.haml" do
  before(:each) do
    assign(:transactions, [
      stub_model(Transaction,
        :amount => "9.99",
        :confirmed => false,
        :from => 1,
        :to => 1
      ),
      stub_model(Transaction,
        :amount => "9.99",
        :confirmed => false,
        :from => 1,
        :to => 1
      )
    ])
  end

  it "renders a list of transactions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
