require 'spec_helper'

describe Link do
  describe ".import_links_from" do
    let(:user) {Factory.stub(:user)}
  end

  describe "#load_data" do
    subject {Link.new}

    it "updates attributes from data" do
      data = {"message" => "bla bla bla",
              "name" => "Name",
              "picture" =>  "http://pictu.re/abc.jpg",
              "created_time" => Time.local(2012, 8, 23).to_s,
              "link" => "http://facebook.com" }

      subject.load_data(data)
      subject.message.should == "bla bla bla"
      subject.name.should == "Name"
      subject.picture.should == "http://pictu.re/abc.jpg"
      subject.created_time.should == Time.local(2012, 8, 23)
    end

    it "should trucate long names" do
      data = {"name" => "A" * 300}
      subject.load_data data
      subject.name.should == "A" * 255
    end

    it "should not load the picture if the length is too long" do
      data = {"picture" => "P" * 256}
      subject.load_data data
      subject.picture.should be_nil
    end

    it "should not load attributes that was not given" do
      subject.load_data({})
      subject.message.should be_nil
      subject.name.should be_nil
      subject.picture.should be_nil
      subject.created_time.should be_nil
    end
  end

end
