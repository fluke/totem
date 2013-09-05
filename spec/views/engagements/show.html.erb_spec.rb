require 'spec_helper'

describe "engagements/show" do
  before(:each) do
    @engagement = assign(:engagement, stub_model(Engagement,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
  end
end
