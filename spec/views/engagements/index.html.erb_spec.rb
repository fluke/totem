require 'spec_helper'

describe "engagements/index" do
  before(:each) do
    assign(:engagements, [
      stub_model(Engagement,
        :description => "Description"
      ),
      stub_model(Engagement,
        :description => "Description"
      )
    ])
  end

  it "renders a list of engagements" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
