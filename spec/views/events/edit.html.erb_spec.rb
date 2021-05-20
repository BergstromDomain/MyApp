require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      title: "MyString",
      details: "MyText",
      day: 1,
      month: 1,
      year: 1,
      main_image: "MyText",
      thumb_image: "MyText"
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input[name=?]", "event[title]"

      assert_select "textarea[name=?]", "event[details]"

      assert_select "input[name=?]", "event[day]"

      assert_select "input[name=?]", "event[month]"

      assert_select "input[name=?]", "event[year]"

      assert_select "textarea[name=?]", "event[main_image]"

      assert_select "textarea[name=?]", "event[thumb_image]"
    end
  end
end
