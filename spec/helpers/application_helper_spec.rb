require 'spec_helper'

describe ApplicationHelper do
  describe "#set_title" do
    it "sets the title to 'likemaks: The Title'" do
      helper.set_title "The Title"
      helper.content_for(:title).should == "likemarks: The Title"
    end
  end

  describe "#manifest_attribute" do
    it "returns nothing when is not in production mode" do
      helper.manifest_attribute.should == ""
    end

    it "returns the appcache when is in production mode" do
      Rails.env.stub(production?: true)
      helper.manifest_attribute.should == 'manifest="/cache.manifest"'
    end
  end

  describe "#query" do
    it "joins the 'username' and 'q' params when they are available" do
      params[:username] = "eden"
      params[:q] = "sucesso"
      helper.query.should == "@eden sucesso"
    end

    it "returns only the 'username'" do
      params[:username] = "woody"
      helper.query.should == "@woody"
    end

    it "returns only the 'q'" do
      params[:q] = "wow"
      helper.query.should == "wow"
    end
  end
end
