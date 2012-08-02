require 'spec_helper'

describe ApplicationHelper do
  describe "#set_title" do
    it "sets the title to 'likemaks: The Title'" do
      helper.set_title "The Title"
      helper.content_for(:title).should == "likemarks: The Title"
    end
  end
end
