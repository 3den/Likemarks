require 'likemarks/link_importer'

module Likemarks
  describe LinkImporter do
    let(:links) {[{}, {}]}
    let(:user) {double(fb_links: links)}

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
  end
end
