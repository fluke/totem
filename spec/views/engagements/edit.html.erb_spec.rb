require 'spec_helper'

describe "engagements/edit" do
  before(:each) do
    @engagement = assign(:engagement, stub_model(Engagement,
      :description => "MyString"
    ))
  end

  it "renders the edit engagement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", engagement_path(@engagement), "post" do
      assert_select "input#engagement_description[name=?]", "engagement[description]"
    end
  end
end
