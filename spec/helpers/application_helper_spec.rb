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
      helper.manifest_attribute.should == 'manifest="cache.manifest"'
    end
  end
end
