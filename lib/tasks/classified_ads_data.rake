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

  desc "Iterates through each newspaper, section and categories, fetching the classified ads"
  task :alert_classifieds => :environment do
    Alert.all.each do |alert|
      puts "alerts for #{alert.email}.."
      classifieds = []
      alert.keywords.split(",").each do |keyword|
        classifieds =  classifieds | Classified.where("category_id = ?", alert.category_id).basic_search(content: keyword)
      end
      AlertMailer.alert_match(alert, classifieds).deliver
    end
  end

end