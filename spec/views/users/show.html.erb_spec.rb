require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :userName => "User Name",
      :realName => "Real Name",
      :userKey => 1,
      :email => "Email",
      :usertype => "Usertype"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User Name/)
    rendered.should match(/Real Name/)
    rendered.should match(/1/)
    rendered.should match(/Email/)
    rendered.should match(/Usertype/)
  end
end
