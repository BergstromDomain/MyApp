require 'rails_helper'

RSpec.describe "people/index", type: :view do
  before(:each) do
    assign(:people, [
      Person.create!(
        first_name: "First Name",
        last_name: "Last Name",
        main_image: "MyText",
        thumb_image: "MyText"
      ),
      Person.create!(
        first_name: "First Name",
        last_name: "Last Name",
        main_image: "MyText",
        thumb_image: "MyText"
      )
    ])
  end

  it "renders a list of people" do
    render
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
