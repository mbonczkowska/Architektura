require 'spec_helper'

describe "lists/edit" do
  before(:each) do
    @list = assign(:list, stub_model(List,
      :first_name => "MyString",
      :last_name => "MyString",
      :login => "MyString",
      :repo => "MyString"
    ))
  end

  it "renders the edit list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lists_path(@list), :method => "post" do
      assert_select "input#list_first_name", :name => "list[first_name]"
      assert_select "input#list_last_name", :name => "list[last_name]"
      assert_select "input#list_login", :name => "list[login]"
      assert_select "input#list_repo", :name => "list[repo]"
    end
  end
end
