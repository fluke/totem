require 'spec_helper'

describe "contacts/show" do
  before(:each) do
    @contact = assign(:contact, stub_model(Contact,
      :name => "Name",
      :group_id => 1,
      :added_by => 2,
      :email_id => "Email",
      :facebook_id => "Facebook",
      :skype_id => "Skype",
      :twitter_id => "Twitter",
      :engagement_count => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Email/)
    rendered.should match(/Facebook/)
    rendered.should match(/Skype/)
    rendered.should match(/Twitter/)
    rendered.should match(/3/)
  end
end
