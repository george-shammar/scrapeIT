![](https://img.shields.io/badge/Microverse-blueviolet)

# scrapeIT
This is an application designed to simplify the process of retrieving data from specified websites. It scrapes desired information off web pages by parsing the HTML content of the pages.

In this case, Airbnb was used as the designated website where specific data is to retrieved. The scraper has been designed to focus on real estate listings the Greater Accra Region of the Republic of Ghana.

The following are the specific data this application has been designed to retrieve from Airbnb.
- Title of the property.
- Price per night in U.S dollars.
- Link to each listing.
- User ratings.

These are vital information that most users of the website need to make decision. The information provided are in real time which gets updated as new listings are added to website.

## Tools and Technologies
### Ruby
The project was built completely using Ruby.

### Nokogiri
Nokogiri is an open source software library to parse HTML and XML in Ruby. It depends on libxml2 and libxslt to provide its functionality.

## About Airbnb
This project was developed to scrape useful data from Airbnb

Airbnb maintains and hosts a marketplace, accessible to consumers on its website or via an app. Through the service, users can arrange lodging, primarily homestays, and tourism experiences or list their properties for rental. Airbnb does not own any of the listed properties; instead, it profits by receiving commission from each booking. The company was founded in 2008 by Brian Chesky, Nathan Blecharczyk and Joe Gebbia. Airbnb is a shortened version of its original name, AirBedandBreakfast.com. 

## Use Cases
### Price/Market intelligence
By using this application to scrape off information from Airbnb's website, especially price information in specific location, it can provide real estate owners listing their properties for rental on the platform valuable price information in an exceptionally qiuck manner. Owners do not need to search hundreds and in some cases, thousands of listings on the website to get the neccessary price information. This would enable owners/users make pricing decision in a timely manner.

### Ease of Use for Users 
This application would simplify the ease with which information about the properties available for rental on the site is retrieved. Users can have access to data about hundreds to thousands of real estate listings in a flash. Users no longer have to navigate through several pages of property listings.  

### Prerequisites

- Ruby
- Terminal

### Set Up

- Go to the "Code" section of this repository and press the green button that says "Code". Copy the URL or the SSH key.
- Go to the terminal and enter:
```
git clone URL/SSH key
```
- If you don't have git you can download this project and unzip it.
- Change directory into the folder the application is saved.
- To install the gems, run:
```
bundle install
```
- From the root directory(SCRAPEIT), run the following to get the above specified data in real time:
```
ruby main.rb
```
- The data is now yours to do as you like.

## Author

