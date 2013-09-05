require 'spec_helper'

describe "phones/new" do
  before(:each) do
    assign(:phone, stub_model(Phone,
      :phone_no => "MyString"
    ).as_new_record)
  end

  it "renders new phone form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", phones_path, "post" do
      assert_select "input#phone_phone_no[name=?]", "phone[phone_no]"
    end
  end
end
