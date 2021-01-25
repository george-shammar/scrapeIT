require 'nokogiri'
require 'httparty'
require 'byebug'

class Whole_web
    attr_reader :ur, :page_number

    def initialize
        page_number = 20
        while page_number <= 40 do 
            @ur_first = 'https://www.airbnb.com/s/Greater-Accra-Region--Ghana/homes?tab_id=home_tab&refinement_paths%5B%5D=%2Fhomes&date_picker_type=calendar&checkin=2021-02-01&checkout=2021-02-02&source=structured_search_input_header&search_type=pagination&place_id=ChIJc6e3soSQ3w8RYQbYT8_WxlM&federated_search_session_id=e8181d27-6be3-4467-87b5-2d4cb71b65c1&map_toggle=false&items_offset='
            @ur_last = '&section_offset=3'
            @ur = "#{@ur_first}#{page_number}#{@ur_last}"
        unparsed_page = HTTParty.get(@ur)
        @parsed_page = Nokogiri::HTML(unparsed_page.body)
        page_number += 20
        end
    end

    def get_title
        @parsed_page.css('div._1isz8pdq').map { |topic| topic.text }
    end

    def get_link
        @parsed_page.css('a._sqvp1j').map { |link| "https://www.airbnb.com" + link['href'] }
    end

    def get_price
        @parsed_page.css('div._4gelgl').css('div._1jqckyi').map { |cost| cost.text }
    end

    def get_rating
        @parsed_page.css('span._11ry7lz').children.each { |rating| rating.remove if rating.name == 'span' }
    end

    def crawl_whole
        crawler_whole = Whole_web.new
        price = crawler_whole.get_price
        title = crawler_whole.get_title
        link = crawler_whole.get_link
        rating = crawler_whole.get_rating
    
        price.each_with_index do |item, index|
         puts "==============================================\n"
         puts "price: #{price[index]}"
         puts "title:  #{title[index]}"
         puts "rating: #{rating[index]}"
         puts "link:  #{link[index]}\n\n"
        end
    end
end