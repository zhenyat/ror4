require 'rails_helper'

RSpec.describe "articles/edit", :type => :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      :authors => "MyString",
      :title => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(@article), "post" do

      assert_select "input#article_authors[name=?]", "article[authors]"

      assert_select "input#article_title[name=?]", "article[title]"

      assert_select "input#article_url[name=?]", "article[url]"
    end
  end
end
