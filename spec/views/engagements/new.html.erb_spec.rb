require 'spec_helper'

describe "engagements/new" do
  before(:each) do
    assign(:engagement, stub_model(Engagement,
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new engagement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", engagements_path, "post" do
      assert_select "input#engagement_description[name=?]", "engagement[description]"
    end
  end
end
