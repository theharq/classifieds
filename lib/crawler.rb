class Crawler

  LAST_PAGE_LINK = "\u00FAltima \u00BB"

  def load_ads_by_category(category)
    agent = self.agent
    page = agent.get(category.url) # Get the current page of the category
    load_list_ads(page,category) # Load the first page of classifieds
    last_page_number = get_last_page(page) # Get the last page number

    if last_page_number.present?
      for pg_number in 1..last_page_number do
        page = agent.get("#{category.url}&page=#{pg_number}")
        load_list_ads(page,category)
      end
    end
  end

  def load_list_ads(page, category)
    Nokogiri::HTML(page.body, 'UTF-8').search("ul.display_result li .datos").each do |item_list|
      category.classifieds.create(content: item_list.css('p').text)
    end
  end

  def self.get_sections_and_categories(name, url)
    crawler = Crawler.new
    agent = crawler.agent
    page = agent.get(url)

    newspaper = Newspaper.where(name: name, url: url).first_or_create

    Nokogiri::HTML(page.body, 'UTF-8').search(".item-list ul li .field-content a").each do |item_list|

      # Get the values for sections and categories, this may change in the future
      category_name = item_list.text
      category_url = item_list['href']
      section_name = item_list['href'].match(/sections=(\w+)/)[1].titleize

      section = newspaper.sections.where(name:section_name).first_or_create
      category = section.categories.where(name: category_name, url: category_url).first_or_create
    end
  end

  def get_last_page(page)
    last_page_link = page.link_with(:text => LAST_PAGE_LINK )
    return last_page_link.present? ? last_page_link.href.match(/page=(\d+)/)[1].to_i : nil
  end

  def agent
    @agent ||= Mechanize.new { |agent|
      agent.user_agent = 'SW User-Agent',
      agent.open_timeout = 3,
      agent.read_timeout = 4,
      agent.keep_alive = false,
      agent.max_history = 0
    }
  end



end