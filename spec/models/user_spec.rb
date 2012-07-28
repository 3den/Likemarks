require "spec_helper"

describe User do

  describe ".from_omniauth" do
    let(:auth) do
      double(provider: "facebook", uid: "1123",
             info: double(name: "Marcelo"),
             credentials: double(token: "1234",
             expires_at: 1321747205),
             slice: {provider: "facebook", uid: "1123"})

    end

    it "creates an new user" do
      user = User.from_omniauth(auth)
      user.oauth_token.should == "1234"
    end

    it "updates existent user" do
      user = User.from_omniauth(auth)
      user.name.should == "Marcelo"
      id = user.id

      auth.info.stub(name: "Eden")
      user = User.from_omniauth(auth)
      user.name.should == "Eden"
      user.id.should == id
    end

  end

  describe "#fb_links" do
    before do
      subject.stub(facebook: double(get_connection: double))
    end

    it "should filter facebook links" do
      links = [
        {"id" => "410267975655826",
         "link" => "http://www.youtube.com/watch?v=pDVORKo8rYs"},
        {"id" => "331784216858206",
         "link" => "http://www.facebook.com/photo.php?fbid=402704943079672"},
      ]
      subject.stub_chain(:facebook, :get_connection){ links }

      subject.fb_links.should == [
        {"id" => "410267975655826",
         "link" => "http://www.youtube.com/watch?v=pDVORKo8rYs"}]
    end
  end
end
