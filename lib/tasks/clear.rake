
namespace :clear do

  desc "Clear all Links"
  task links: :environment do
    count = Link.all.size
    Link.delete_all
    puts "Deleted #{count} links deleted"
  end
end
