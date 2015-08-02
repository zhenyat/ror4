require 'rails_helper'

RSpec.describe "articles/show", :type => :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      :authors => "Authors",
      :title => "Title",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Authors/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Url/)
  end
end
