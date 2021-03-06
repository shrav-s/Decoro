require 'rails_helper'

RSpec.describe "listings/new", type: :view do
  before(:each) do
    assign(:listing, Listing.new(
      name: "MyString",
      category: nil,
      material: nil,
      price: 1,
      description: "MyText"
    ))
  end

  it "renders new listing form" do
    render

    assert_select "form[action=?][method=?]", listings_path, "post" do

      assert_select "input[name=?]", "listing[name]"

      assert_select "input[name=?]", "listing[category_id]"

      assert_select "input[name=?]", "listing[material_id]"

      assert_select "input[name=?]", "listing[price]"

      assert_select "textarea[name=?]", "listing[description]"
    end
  end
end
