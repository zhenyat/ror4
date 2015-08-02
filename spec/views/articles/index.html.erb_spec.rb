require 'rails_helper'

RSpec.describe "articles/index", :type => :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        :authors => "Authors",
        :title => "Title",
        :url => "Url"
      ),
      Article.create!(
        :authors => "Authors",
        :title => "Title",
        :url => "Url"
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => "Authors".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
