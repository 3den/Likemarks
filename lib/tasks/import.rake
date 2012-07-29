
namespace :import do

  desc "Import Links from all users"
  task links: :environment do
    limit = ENV['limit'] || 100
    User.find_each do |user|
      Link.import_links_from(user, limit) rescue nil
      p "Imported #{user.links.size} links from #{user.name}..."
    end
  end
end
