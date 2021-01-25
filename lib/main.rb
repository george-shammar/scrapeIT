require_relative './lib/web_crawler'

scrape = Web_crawler.new 
scrape.crawl

next_page = Whole_web.new 
next_page.crawl