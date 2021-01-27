require_relative './lib/web_crawler'
require_relative './lib/whole_web'

scrape = Crawler.new
scrape.display

scrape_whole = Web.new
scrape_whole.display_whole
