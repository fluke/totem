require 'spec_helper'

describe "contacts/index" do
  before(:each) do
    assign(:contacts, [
      stub_model(Contact,
        :name => "Name",
        :group_id => 1,
        :added_by => 2,
        :email_id => "Email",
        :facebook_id => "Facebook",
        :skype_id => "Skype",
        :twitter_id => "Twitter",
        :engagement_count => 3
      ),
      stub_model(Contact,
        :name => "Name",
        :group_id => 1,
        :added_by => 2,
        :email_id => "Email",
        :facebook_id => "Facebook",
        :skype_id => "Skype",
        :twitter_id => "Twitter",
        :engagement_count => 3
      )
    ])
  end

  it "renders a list of contacts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Facebook".to_s, :count => 2
    assert_select "tr>td", :text => "Skype".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
