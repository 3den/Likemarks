require 'spec_helper'

describe SearchesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    let(:user) { FactoryGirl.build_stubbed(:user) }
    it "returns http success" do
      User.should_receive(:find).with("1").and_return(user)
      user.should_receive(:fb_links).and_return([])
      get 'show', id: 1
      assigns[:results].should == []
      response.should render_template('show')
    end
  end

end
