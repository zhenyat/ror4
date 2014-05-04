require 'spec_helper'

describe "products/edit" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :category_id => 1,
      :name => "MyString",
      :sku => "MyString",
      :price => "9.99"
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_path(@product), "post" do
      assert_select "input#product_category_id[name=?]", "product[category_id]"
      assert_select "input#product_name[name=?]", "product[name]"
      assert_select "input#product_sku[name=?]", "product[sku]"
      assert_select "input#product_price[name=?]", "product[price]"
    end
  end
end
