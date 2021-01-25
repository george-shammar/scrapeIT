require 'nokogiri'
require 'httparty'
require 'byebug'

class Web_crawler
  attr_reader :url, :page_number

  def initialize
    @url = 'https://www.airbnb.com/s/Greater-Accra-Region--Ghana/homes?tab_id=home_tab&refinement_paths%5B%5D=%2Fhomes&date_picker_type=calendar&checkin=2021-02-01&checkout=2021-02-02&source=structured_search_input_header&search_type=pagination&place_id=ChIJc6e3soSQ3w8RYQbYT8_WxlM&federated_search_session_id=21f7da73-547c-4a98-88a0-66c2a6e4cff0&map_toggle=false'
    unparsed_page = HTTParty.get(url)
    @parsed_page = Nokogiri::HTML(unparsed_page.body)
  end

  def get_title
    @parsed_page.css('div._1isz8pdq').map(&:text)
  end

  def get_link
    @parsed_page.css('a._sqvp1j').map { |link| 'https://www.airbnb.com' + link['href'] }
  end

  def get_price
    @parsed_page.css('div._4gelgl').css('div._1jqckyi').map(&:text)
  end

  def get_rating
    @parsed_page.css('span._11ry7lz').children.each { |rating| rating.remove if rating.name == 'span' }
  end

  def crawl
    crawler = Web_crawler.new
    price = crawler.get_price
    title = crawler.get_title
    link = crawler.get_link
    rating = crawler.get_rating

    price.each_with_index do |_item, index|
      puts "==============================================\n"
      puts "price: #{price[index]}"
      puts "title:  #{title[index]}"
      puts "rating: #{rating[index]}"
      puts "link:  #{link[index]}\n\n"
    end
  end
end
