require 'likemarks/link_importer'

module Likemarks
  describe LinkImporter do
    let(:links) {[{}, {}]}
    let(:user) {double(fb_links: links, name: "Joao")}

    describe ".import_from" do
      it "imports links from user" do
        item = LinkImporter.new(user, {})
        item.should_receive(:save)
        item.should_receive(:save)
        LinkImporter.
          stub(:new).
          with(user, {}).
          and_return(item)

        links = LinkImporter.import_from(user)
      end
    end

    it "handles an error on the import" do
      user.should_receive(:fb_links) {fail "something happened"}
      class Rails; end
      Rails.stub(logger: double)
      Rails.logger.
        should_receive(:info).
        with("Links could not be imported for #{user.name}")

      expect {
        LinkImporter.import_from(user)
      }.to_not raise_error
    end
  end
end
