require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        title: "Title",
        details: "MyText",
        day: 2,
        month: 3,
        year: 4,
        main_image: "MyText",
        thumb_image: "MyText"
      ),
      Event.create!(
        title: "Title",
        details: "MyText",
        day: 2,
        month: 3,
        year: 4,
        main_image: "MyText",
        thumb_image: "MyText"
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
