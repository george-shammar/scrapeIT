require_relative './lib/web_crawler'

scrape = Web_crawler.new 
scrape.crawl

scrape_whole = Whole_web.new 
scrape_whole.crawl