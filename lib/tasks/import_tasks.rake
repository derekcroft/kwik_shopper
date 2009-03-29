namespace :import do
  desc "Import from Kroger CSV"
  task :kroger => :environment do
    puts "yo"
    FasterCSV.foreach("#{RAILS_ROOT}/db/kroger_scs_feed.csv") do |row|
      
    end
  end
end