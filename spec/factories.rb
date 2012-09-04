FactoryGirl.define do
  sequence(:random_url) {|n| "http://3den.org/#{n}" }

  factory :link do
    name "Super Noticia"
    picture "http://my.picture.com/abc.jpg"
    link { generate :random_url }
    message "bla bla bla bla bla bla bla"
    created_time Time.now
  end

  factory :user do
    name "Marcelo Eden"
    username "eden"
    picture "http://my.picture.com/abc.jpg"
    oauth_token "xxx"
    oauth_expires_at Time.now
    provider "facebook"
    uid "123"
  end
end


