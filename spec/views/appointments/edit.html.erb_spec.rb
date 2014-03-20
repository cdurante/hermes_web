require 'spec_helper'

describe "appointments/edit" do
  before(:each) do
    @appointment = assign(:appointment, stub_model(Appointment,
      :appointmentKey => 1,
      :location => "MyString",
      :notes => "MyText"
    ))
  end

  it "renders the edit appointment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", appointment_path(@appointment), "post" do
      assert_select "input#appointment_appointmentKey[name=?]", "appointment[appointmentKey]"
      assert_select "input#appointment_location[name=?]", "appointment[location]"
      assert_select "textarea#appointment_notes[name=?]", "appointment[notes]"
    end
  end
end
