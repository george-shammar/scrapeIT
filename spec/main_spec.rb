require 'nokogiri'
require 'httparty'
require_relative '../lib/web_crawler'
require_relative '../lib/whole_web'

describe Web_crawler do
    @url = 'https://www.airbnb.com/s/Greater-Accra-Region--Ghana/homes?tab_id=home_tab&refinement_paths%5B%5D=%2Fhomes&date_picker_type=calendar&checkin=2021-02-01&checkout=2021-02-02&source=structured_search_input_header&search_type=pagination&place_id=ChIJc6e3soSQ3w8RYQbYT8_WxlM&federated_search_session_id=21f7da73-547c-4a98-88a0-66c2a6e4cff0&map_toggle=false'
    unparsed_page = HTTParty.get(@url)
    @parsed_page = Nokogiri::HTML(unparsed_page.body)
    page = Web_crawler.new
    title = @parsed_page.css('div._1isz8pdq').map(&:text)

    describe '#take_title' do
    title_example = "Cozy Studio in Passion Hills Apartment"
    it 'returns the title of the listing on the first page' do
        expect(page.take_title).to include(title_example)
    end
    end
end