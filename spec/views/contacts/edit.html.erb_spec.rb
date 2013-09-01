require 'spec_helper'

describe "contacts/edit" do
  before(:each) do
    @contact = assign(:contact, stub_model(Contact,
      :name => "MyString",
      :group_id => 1,
      :added_by => 1,
      :email_id => "MyString",
      :facebook_id => "MyString",
      :skype_id => "MyString",
      :twitter_id => "MyString",
      :engagement_count => 1
    ))
  end

  it "renders the edit contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contact_path(@contact), "post" do
      assert_select "input#contact_name[name=?]", "contact[name]"
      assert_select "input#contact_group_id[name=?]", "contact[group_id]"
      assert_select "input#contact_added_by[name=?]", "contact[added_by]"
      assert_select "input#contact_email_id[name=?]", "contact[email_id]"
      assert_select "input#contact_facebook_id[name=?]", "contact[facebook_id]"
      assert_select "input#contact_skype_id[name=?]", "contact[skype_id]"
      assert_select "input#contact_twitter_id[name=?]", "contact[twitter_id]"
      assert_select "input#contact_engagement_count[name=?]", "contact[engagement_count]"
    end
  end
end
