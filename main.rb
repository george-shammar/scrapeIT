require_relative './lib/web_crawler'
require_relative './lib/whole_web'

scrape = Web_crawler.new 
scrape.crawl

scrape_whole = Whole_web.new 
scrape_whole.crawl_whole