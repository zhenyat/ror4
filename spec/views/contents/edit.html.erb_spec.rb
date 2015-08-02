require 'rails_helper'

RSpec.describe "contents/edit", :type => :view do
  before(:each) do
    @content = assign(:content, Content.create!(
      :article => nil,
      :doc => "MyText"
    ))
  end

  it "renders the edit content form" do
    render

    assert_select "form[action=?][method=?]", content_path(@content), "post" do

      assert_select "input#content_article_id[name=?]", "content[article_id]"

      assert_select "textarea#content_doc[name=?]", "content[doc]"
    end
  end
end
