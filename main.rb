require_relative './lib/web_crawler'
require_relative './lib/whole_web'

scrape = Crawler.new
scrape.crawl

scrape_whole = Web.new
scrape_whole.crawl_whole
