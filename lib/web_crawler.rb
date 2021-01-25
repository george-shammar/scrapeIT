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
        @parsed_page.css('div._1isz8pdq').map { |topic| topic.text }
    end
end