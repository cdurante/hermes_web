require 'spec_helper'

describe "forms/index" do
  before(:each) do
    assign(:forms, [
      stub_model(Form,
        :formkey => 1,
        :source => "Source"
      ),
      stub_model(Form,
        :formkey => 1,
        :source => "Source"
      )
    ])
  end

  it "renders a list of forms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Source".to_s, :count => 2
  end
end
