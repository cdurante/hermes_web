require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :userName => "MyString",
      :realName => "MyString",
      :userKey => 1,
      :email => "MyString",
      :usertype => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_userName[name=?]", "user[userName]"
      assert_select "input#user_realName[name=?]", "user[realName]"
      assert_select "input#user_userKey[name=?]", "user[userKey]"
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "input#user_usertype[name=?]", "user[usertype]"
    end
  end
end
