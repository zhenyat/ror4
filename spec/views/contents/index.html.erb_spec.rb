require 'rails_helper'

RSpec.describe "contents/index", :type => :view do
  before(:each) do
    assign(:contents, [
      Content.create!(
        :article => nil,
        :doc => "MyText"
      ),
      Content.create!(
        :article => nil,
        :doc => "MyText"
      )
    ])
  end

  it "renders a list of contents" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
