require 'spec_helper'

describe Link do

  describe ".import_links_from" do
    let(:user) do
      User.create(name: "Marcelo", oauth_token: "123",
                  provider: "facebook", uid: "1234")
    end
  end
end
