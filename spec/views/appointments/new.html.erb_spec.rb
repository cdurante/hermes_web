require 'spec_helper'

describe "appointments/new" do
  before(:each) do
    assign(:appointment, stub_model(Appointment,
      :appointmentKey => 1,
      :location => "MyString",
      :notes => "MyText"
    ).as_new_record)
  end

  it "renders new appointment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", appointments_path, "post" do
      assert_select "input#appointment_appointmentKey[name=?]", "appointment[appointmentKey]"
      assert_select "input#appointment_location[name=?]", "appointment[location]"
      assert_select "textarea#appointment_notes[name=?]", "appointment[notes]"
    end
  end
end
