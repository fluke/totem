require 'spec_helper'

describe "groups/index" do
  before(:each) do
    assign(:groups, [
      stub_model(Group,
        :group_creator_id => 1,
        :name => "Name",
        :size => 2,
        :password => "Password"
      ),
      stub_model(Group,
        :group_creator_id => 1,
        :name => "Name",
        :size => 2,
        :password => "Password"
      )
    ])
  end

  it "renders a list of groups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
  end
end
