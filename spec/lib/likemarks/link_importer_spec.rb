require 'likemarks/link_importer'

module Likemarks
  describe LinkImporter do
    let(:links) {[double, double]}
    let(:user) {double}
    subject {LinkImporter.new user}

    describe "#import" do
      it "imports links from user" do
        links = subject.import
        links.should == links
      end
    end
  end
end
