require 'spec_helper'

describe SearchesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    let(:results) {[double]}
    let(:user) {double(links: double(page: results),
                       username: "marcelo")}

    it "returns http success" do
      User.should_receive(:find).with("1").and_return(user)
      Link.should_receive(:import_links_from).with(user)

      get 'show', id: 1
      assigns[:results].should == results
      response.should render_template('show')
    end
  end

end
