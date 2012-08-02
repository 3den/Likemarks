require "spec_helper"

describe User do

  describe ".from_omniauth" do
    let(:auth) do
      double(provider: "facebook", uid: "1123",
             info: double(name: "Marcelo", nickname: "eden",
                          image: "http://image.com/abn.jpg"),
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

end
