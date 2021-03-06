require 'spec_helper'

describe "pictures/index" do
  before(:each) do
    assign(:pictures, [
      stub_model(Picture,
        :filename => "Filename",
        :title => "Title"
      ),
      stub_model(Picture,
        :filename => "Filename",
        :title => "Title"
      )
    ])
  end

  it "renders a list of pictures" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Filename".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
