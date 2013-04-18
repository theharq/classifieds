namespace :classifieds do

  desc "Iterates through each newspaper, section and categories, fetching the classified ads"
  task :get_classifieds => :environment do
    Classified.destroy_all
    crawler = Crawler.new

    Newspaper.all.each do |newspaper|
      newspaper.sections.each do |section|
        section.categories.each do |category|
          puts "loading #{category.name}.."
          crawler.load_ads_by_category(category)
        end
      end
    end
  end

  desc "Iterates through all alerts, make a search through the keywords and send an email with the matches"
  task :alert_classifieds => :environment do
    Alert.all.each do |alert|
      puts "alerts for #{alert.email}.."
      classifieds = []
      query = alert.keywords.split(",").join("|")
      results = Classified.joins(:category).advanced_search(query).group_by(&:category)

      AlertMailer.alert_match(alert, results).deliver if results.any?
    end
  end

end