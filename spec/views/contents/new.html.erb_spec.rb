require 'rails_helper'

RSpec.describe "contents/new", :type => :view do
  before(:each) do
    assign(:content, Content.new(
      :article => nil,
      :doc => "MyText"
    ))
  end

  it "renders new content form" do
    render

    assert_select "form[action=?][method=?]", contents_path, "post" do

      assert_select "input#content_article_id[name=?]", "content[article_id]"

      assert_select "textarea#content_doc[name=?]", "content[doc]"
    end
  end
end
