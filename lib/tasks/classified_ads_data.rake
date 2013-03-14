namespace :classified_ads_data do

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
end