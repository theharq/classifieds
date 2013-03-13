class Crawler

  def self.get_page(url)
    @agent = Mechanize.new
    @agent.user_agent = 'SW User-Agent'
    @agent.open_timeout = 3
    @agent.read_timeout = 4
    @agent.keep_alive = false
    @agent.max_history = 0

    classifieds = []

    page = @agent.get(url)
    last_page_link = page.link_with(:text => "\u00FAltima \u00BB")

    html_doc = Nokogiri::HTML(page.body, 'UTF-8')

    html_doc.search("ul.display_result li .datos").each do |item_list|
     classifieds << Classified.new(content: item_list.css('p').text)
    end

    if last_page_link.present?
      last_page_number = last_page_link.href.match(/page=(\d+)/)[1].to_i

      for pg_number in 1..last_page_number do

        page = @agent.get("#{url}&page=#{pg_number}")

        html_doc = Nokogiri::HTML(page.body, 'UTF-8')

        html_doc.search("ul.display_result li .datos").each do |item_list|
         classifieds << Classified.new(content: item_list.css('p').text)
        end

      end
    end

    classifieds
  end



end