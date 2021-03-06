require 'rails_helper'

RSpec.describe "listings/edit", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      name: "MyString",
      category: nil,
      material: nil,
      price: 1,
      description: "MyText"
    ))
  end

  it "renders the edit listing form" do
    render

    assert_select "form[action=?][method=?]", listing_path(@listing), "post" do

      assert_select "input[name=?]", "listing[name]"

      assert_select "input[name=?]", "listing[category_id]"

      assert_select "input[name=?]", "listing[material_id]"

      assert_select "input[name=?]", "listing[price]"

      assert_select "textarea[name=?]", "listing[description]"
    end
  end
end
