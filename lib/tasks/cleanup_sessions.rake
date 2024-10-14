namespace :sessions do
  desc "Cleanup old sessions from the database"
  task cleanup: :environment do
    threshold = 30.days.ago
    ActiveRecord::SessionStore::Session.where('updated_at < ?', threshold).delete_all
    puts "Deleted sessions older than 30 days"
  end
end