require 'spec_helper'

describe "phones/index" do
  before(:each) do
    assign(:phones, [
      stub_model(Phone,
        :phone_no => "Phone No"
      ),
      stub_model(Phone,
        :phone_no => "Phone No"
      )
    ])
  end

  it "renders a list of phones" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone No".to_s, :count => 2
  end
end
