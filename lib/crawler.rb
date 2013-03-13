class Crawler

  LAST_PAGE_LINK = "\u00FAltima \u00BB"

  def self.get_ads_by_section(url)
    agent = Mechanize.new
    crawler = Crawler.new
    agent.user_agent = 'SW User-Agent'
    agent.open_timeout = 3
    agent.read_timeout = 4
    agent.keep_alive = false
    agent.max_history = 0
    page = agent.get(url)

    classifieds = crawler.get_list_ads(page)

    last_page_number = crawler.get_last_page(page)

    if last_page_number.present?
      for pg_number in 1..last_page_number do
        page = agent.get("#{url}&page=#{pg_number}")
        classifieds =  classifieds | crawler.get_list_ads(page)
      end
    end

    classifieds
  end

  def get_list_ads(page)
    classifieds = []
    Nokogiri::HTML(page.body, 'UTF-8').search("ul.display_result li .datos").each do |item_list|
      classifieds << Classified.new(content: item_list.css('p').text)
    end
    classifieds
  end

  def get_last_page(page)
    last_page_link = page.link_with(:text => LAST_PAGE_LINK )
    return last_page_link.present? ? last_page_link.href.match(/page=(\d+)/)[1].to_i : nil
  end



end