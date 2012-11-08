require 'spec_helper'

describe "lists/show" do
  before(:each) do
    @list = assign(:list, stub_model(List,
      :first_name => "First Name",
      :last_name => "Last Name",
      :login => "Login",
      :repo => "Repo"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Login/)
    rendered.should match(/Repo/)
  end
end
