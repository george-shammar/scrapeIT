require_relative '../lib/web_crawler'
require_relative '../lib/whole_web'

class Display
  def front_page
    crawler = Crawler.new
    price = crawler.take_price
    title = crawler.take_title
    link = crawler.take_link
    rating = crawler.take_rating

    price.each_with_index do |_item, index|
      puts "==============================================\n"
      puts "price: #{price[index]}"
      puts "title:  #{title[index]}"
      puts "rating: #{rating[index]}"
      puts "link:  #{link[index]}\n\n"
    end
  end

  def whole_web
    crawler_whole = Web.new
    price_whole_web = crawler_whole.full_price
    title_whole_web = crawler_whole.full_title
    link_whole_web = crawler_whole.full_link
    rating_whole_web = crawler_whole.full_rating

    price_whole_web.each_with_index do |_item, index|
      puts "==============================================\n"
      puts "price: #{price_whole_web[index]}"
      puts "title:  #{title_whole_web[index]}"
      puts "rating: #{rating_whole_web[index]}"
      puts "link:  #{link_whole_web[index]}\n\n"
    end
  end
end

scrape = Display.new
scrape.front_page

scrape_full = Display.new
scrape_full.whole_web
