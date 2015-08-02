require 'rails_helper'

RSpec.describe "articles/new", :type => :view do
  before(:each) do
    assign(:article, Article.new(
      :authors => "MyString",
      :title => "MyString",
      :url => "MyString"
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input#article_authors[name=?]", "article[authors]"

      assert_select "input#article_title[name=?]", "article[title]"

      assert_select "input#article_url[name=?]", "article[url]"
    end
  end
end
