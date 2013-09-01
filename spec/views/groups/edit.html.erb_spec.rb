require 'spec_helper'

describe "groups/edit" do
  before(:each) do
    @group = assign(:group, stub_model(Group,
      :group_creator_id => 1,
      :name => "MyString",
      :size => 1,
      :password => "MyString"
    ))
  end

  it "renders the edit group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", group_path(@group), "post" do
      assert_select "input#group_group_creator_id[name=?]", "group[group_creator_id]"
      assert_select "input#group_name[name=?]", "group[name]"
      assert_select "input#group_size[name=?]", "group[size]"
      assert_select "input#group_password[name=?]", "group[password]"
    end
  end
end
