require 'likemarks/facebook'
require 'koala'

module Likemarks
  describe Facebook do
    let(:fb) {double}
    subject do
      Koala::Facebook::API.stub(new: fb)
      Facebook.new "token"
    end

    describe "#links" do
      it "returns only non banned links" do
        fb.should_receive(:get_connection).
          with("me", "links?limit=10").
          and_return([
            {"link" => "facebook.com/something"},
            {"link" => "http://mooday.mexxx/something"},
            {"link" => "3den.com"}
          ])

        subject.links(10).should == [{"link" => "3den.com"}]
      end
    end

  end
end
