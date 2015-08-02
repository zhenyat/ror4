require 'rails_helper'

RSpec.describe "contents/show", :type => :view do
  before(:each) do
    @content = assign(:content, Content.create!(
      :article => nil,
      :doc => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
