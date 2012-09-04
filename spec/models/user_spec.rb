require "spec_helper"

describe User do
  describe "#valid?" do
    let(:attributes) {{name: "Marcelo Eden", username: "eden",
                       oauth_token: "123"}}

    [:username, :name, :oauth_token].each do |key|
      it "validates presence of #{key}" do
        user = User.new

        user.should_not be_valid
        user.errors[key].should include "can't be blank"
      end
    end

    it "validates uniqueness of username" do
      FactoryGirl.create(:user)
      user = FactoryGirl.build(:user)

      user.should_not be_valid
      user.errors[:username].should include "has already been taken"
    end
  end

  describe ".from_omniauth" do
    let(:auth) do
      double(
        provider: "facebook", uid: "1123",
        info: double(
          name: "Marcelo",
          nickname: "eden",
          image: "http://image.com/abn.jpg"
        ),
        credentials: double(token: "1234",
        expires_at: 1321747205),
        slice: {provider: "facebook", uid: "1123"}
      )
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
