require 'spec_helper'

describe SearchesHelper do
  describe "#link_to_users" do
    it "show the link to a single user" do
      users = double(limit: [
        double(name: "Mark", id: 1, to_param: "mark")
      ])

      html = helper.link_to_users(users)
      html.should == '<a href="/mark">Mark</a>'
    end

    it "show the two users separated by coma" do
      users = double(limit: [
        double(name: "Mark", id: 1, to_param: "mark"),
        double(name: "Eden", id: 2, to_param: "marceloeden")
      ])

      html = helper.link_to_users(users)
      html.should == '<a href="/mark">Mark</a>, <a href="/marceloeden">Eden</a>'
    end
  end

  describe "#picture_for" do
    it "returns an image tag if the picture starts with http" do
      html = helper.picture_for "http://something"
      html.should == '<img alt="Something" src="http://something" />'
    end

    it "returns nothing if the picture starts with /assets" do
      html = helper.picture_for "/assets/something.png"
      html.should == ''
    end
  end
end
