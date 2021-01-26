require 'nokogiri'
require 'httparty'
require_relative '../lib/web_crawler'
require_relative '../lib/whole_web'

describe Crawler do
  @url = 'https://www.airbnb.com/s/Greater-Accra-Region--Ghana/homes?tab_id=home_tab&refinement_paths%5B%5D=%2Fhomes&date_picker_type=calendar&checkin=2021-02-01&checkout=2021-02-02&source=structured_search_input_header&search_type=pagination&place_id=ChIJc6e3soSQ3w8RYQbYT8_WxlM&federated_search_session_id=21f7da73-547c-4a98-88a0-66c2a6e4cff0&map_toggle=false'
  unparsed_page = HTTParty.get(@url)
  @parsed_page = Nokogiri::HTML(unparsed_page.body)
  page = Crawler.new

  describe '#take_title' do
    it 'returns the title of the listing on the first page' do
      title_example = 'Cozy Studio in Passion Hills Apartment'
      expect(page.take_title).to include(title_example)
    end
    it 'does not return a value that is not a title' do
      non_title = 'Peculiar Apartment in Paris'
      expect(page.take_title).not_to include(non_title)
    end
  end

  describe '#take_link' do
    it 'returns an array with the required information from the first page' do
      expect(page.take_link).to be_an Array
    end
    it 'does not return a value or array that is not a link on the first page' do
      non_link = 'https://www.codedli.com'
      expect(page.take_link).not_to include(non_link)
    end
  end

  describe '#take_price' do
    it 'returns an array with the price of the listing on the first page' do
      expect(page.take_price).to be_an Array
    end
  end

  describe '#take_rating' do
    it 'returns values that are true within the website' do
      expect(page.take_rating).to be_truthy
    end
  end
end

describe Web do
  @url = 'https://www.airbnb.com/s/Greater-Accra-Region--Ghana/homes?tab_id=home_tab&refinement_paths%5B%5D=%2Fhomes&date_picker_type=calendar&checkin=2021-02-01&checkout=2021-02-02&source=structured_search_input_header&search_type=pagination&place_id=ChIJc6e3soSQ3w8RYQbYT8_WxlM&federated_search_session_id=4cbf4758-8321-44da-bd34-41a10eace6c2&map_toggle=false&items_offset=40&section_offset=3'
  unparsed_page = HTTParty.get(@url)
  @parsed_page = Nokogiri::HTML(unparsed_page.body)
  page_whole = Web.new

  describe '#full_title' do
    it 'returns the title of the listing on the rest of the website' do
      title_example = 'Airport Residential Very Spacious Suite'
      expect(page_whole.full_title).to include(title_example)
    end
    it 'does not return a value that is not a title' do
      non_title = 'Peculiar Apartment in Paris'
      expect(page_whole.full_title).not_to include(non_title)
    end
  end

  describe '#full_link' do
    it 'returns an array with the required information from the rest of the site' do
      expect(page_whole.full_link).to be_an Array
    end
    it 'does not return a value or array that is not a link on the first page' do
      non_link = 'https://www.codedli.com'
      expect(page_whole.full_link).not_to include(non_link)
    end
  end

  describe '#full_price' do
    it 'returns an array with the price of the listing on the rest of the site' do
      expect(page_whole.full_price).to be_an Array
    end
  end

  describe '#take_rating' do
    it 'returns values for ratings that are true within the website' do
      expect(page_whole.full_rating).to be_truthy
    end
  end
end
