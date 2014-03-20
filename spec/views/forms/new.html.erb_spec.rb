require 'spec_helper'

describe "forms/new" do
  before(:each) do
    assign(:form, stub_model(Form,
      :formkey => 1,
      :source => "MyString"
    ).as_new_record)
  end

  it "renders new form form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", forms_path, "post" do
      assert_select "input#form_formkey[name=?]", "form[formkey]"
      assert_select "input#form_source[name=?]", "form[source]"
    end
  end
end
