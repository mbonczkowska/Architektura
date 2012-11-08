require 'spec_helper'

describe "lists/index" do
  before(:each) do
    assign(:lists, [
      stub_model(List,
        :first_name => "First Name",
        :last_name => "Last Name",
        :login => "Login",
        :repo => "Repo"
      ),
      stub_model(List,
        :first_name => "First Name",
        :last_name => "Last Name",
        :login => "Login",
        :repo => "Repo"
      )
    ])
  end

  it "renders a list of lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Login".to_s, :count => 2
    assert_select "tr>td", :text => "Repo".to_s, :count => 2
  end
end
